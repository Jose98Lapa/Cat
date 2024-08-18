//
//  BreedRepository.swift
//  CatMate
//
//  Created by José Miguel Lapa on 18/08/2024.
//

import Foundation

protocol BreedRepositoryProtocol {
    func fetchBreeds() -> [Breed]
    func fetchBreed(byId: UUID) -> Breed?
    func favouriteBreed(byId: UUID)
}

class BreedRepository: BreedRepositoryProtocol {
    
    private let netWorker: NetWorkerProtocol
    private let cacheWorker: CacheWorkerProtocol
    
    init(netWorker: NetWorkerProtocol, cacheWorker: CacheWorkerProtocol) {
        self.netWorker = netWorker
        self.cacheWorker = cacheWorker
    }
    
    func fetchBreeds() -> [Breed] {
        return [Breed()]
    }
    
    func fetchBreed(byId: UUID) -> Breed? {
        return nil
    }
    
    func favouriteBreed(byId: UUID) {
        
    }
}
