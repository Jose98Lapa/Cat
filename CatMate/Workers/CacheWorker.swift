//
//  CacheWorker.swift
//  CatMate
//
//  Created by José Miguel Lapa on 18/08/2024.
//

import Foundation

protocol CacheWorkerProtocol {
    func fetchBreeds() -> [Breed]
    func fetchBreed(byId: UUID) -> Breed?
    func favouriteBreed(byId: UUID)
}

class CacheWorker: NetWorkerProtocol {
    
    func fetchBreeds() -> [Breed] {
        [Breed()]
    }
    
    func fetchBreed(byId: UUID) -> Breed? {
        return nil
    }
    
    func favouriteBreed(byId: UUID) {
    
    }
}
