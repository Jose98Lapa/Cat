//
//  GetBreedsRequest.swift
//  CatMate
//
//  Created by José Miguel Lapa on 18/08/2024.
//

import Foundation

struct GetBreedsRequest: Request {
    
    var url: URL?
    var method: HTTPMethod
    var parameters: [String : String]?
    var body: Data?
    
    init(parameters: [String : String]? = nil) {
        self.url = URL(string: GetBreedsRequest.baseURLString.appending("breeds"))
        self.method = .GET
        self.parameters = parameters
    }
}
