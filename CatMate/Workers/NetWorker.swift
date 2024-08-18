//
//  NetWorker.swift
//  CatMate
//
//  Created by José Miguel Lapa on 18/08/2024.
//

import Foundation

protocol NetWorkerProtocol {
    func fetchBreeds() -> [Breed]
    func favouriteBreed(byId: UUID)
}

class NetWorker: NetWorkerProtocol {
    
    func fetchBreeds() -> [Breed] {
        [Breed()]
    }
    
    func favouriteBreed(byId: UUID) {
        
    }
}
