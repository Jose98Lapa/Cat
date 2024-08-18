//
//  BreedRepositoryProtocol.swift
//  CatMate
//
//  Created by José Miguel Lapa on 18/08/2024.
//

import Foundation

class MockBreedRepository: BreedRepositoryProtocol {
    
    func fetchBreeds() -> [Breed] {
        return [Breed()]
    }
    
    func favouriteBreed(byId: UUID) {
        
    }
}
