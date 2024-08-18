//
//  GetBreedByIdRequest.swift
//  CatMate
//
//  Created by José Miguel Lapa on 18/08/2024.
//

import Foundation

struct GetBreedByIdRequest: Request {
    
    var url: URL?
    var method: HTTPMethod
    var parameters: [String : String]?
    var body: Data?
    
    init(id: UUID) {
        self.url = URL(string: GetBreedsRequest.baseURLString.appending("breeds").appending("/").appending(id.uuidString))
        self.method = .GET
    }
}
