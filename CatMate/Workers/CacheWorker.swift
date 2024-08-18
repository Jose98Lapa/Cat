//
//  CacheWorker.swift
//  CatMate
//
//  Created by José Miguel Lapa on 18/08/2024.
//

import Foundation

protocol CacheWorkerProtocol {
    func fetchBreeds() -> [Breed]
    func favouriteBreed(byId: UUID)
}

class CacheWorker: NetWorkerProtocol {
    
    func fetchBreeds() -> [Breed] {
        [Breed()]
    }
    
    func favouriteBreed(byId: UUID) {
    
    }
}
