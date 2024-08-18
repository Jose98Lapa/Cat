//
//  Endpoint.swift
//  Gatinhos
//
//  Created by José Miguel Lapa on 17/08/2024.
//


import Foundation

protocol Request {
    var url: URL? { get }
    var method: HTTPMethod { get }
    var parameters: [String: String]? { get }
    var body: Data? { get set }
}

extension Request {
    
    static var baseURLString: String { return "https://api.thecatapi.com/v1/" }
    
    func formulateURLRequest() throws -> URLRequest {
        
        guard let url else {
            throw NetworkError.badURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue(HTTPBodyConfiguration.JSON, forHTTPHeaderField: "Content-Type")
        
        if let APIKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            request.setValue(APIKey, forHTTPHeaderField: "x-api-key")
        }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = parameters?.map { URLQueryItem(name: $0.key, value: $0.value) }
        request.url = urlComponents?.url
        
        if let body {
            do {
                let jsonData = try JSONEncoder().encode(parameters)
                request.httpBody = jsonData
            } catch {
                throw NetworkError.encodingFailed(error)
            }
        }
        
        return request
    }
}
