//
//  GetFavouritesRequest.swift
//  CatMate
//
//  Created by José Miguel Lapa on 18/08/2024.
//

import Foundation

struct GetFavouritesRequest: Request {
    
    var url: URL?
    var method: HTTPMethod
    var parameters: [String : String]?
    var body: Data?
    
    init() {
        self.url = URL(string: GetBreedsRequest.baseURLString.appending("favourites"))
        self.method = .GET
    }
}
