//
//  BreedRepository.swift
//  CatMate
//
//  Created by José Miguel Lapa on 18/08/2024.
//

import Foundation

protocol BreedRepositoryProtocol {
    func fetchBreeds() -> [Breed]
    func favouriteBreed(byId: UUID)
}

class BreedRepository: BreedRepositoryProtocol {
    
    func fetchBreeds() -> [Breed] {
        return [Breed()]
    }
    
    func favouriteBreed(byId: UUID) {
        
    }
}
