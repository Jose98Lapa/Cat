//
//  MockNetWorker.swift
//  CatMate
//
//  Created by José Miguel Lapa on 18/08/2024.
//

import Foundation

class MockNetWorker: NetWorkerProtocol {
    
    var breeds: [Breed] = Array(repeating: Breed(), count: 200)
    
    func fetchBreeds() -> [Breed] {
        Array(breeds[0..<20])
    }
    
    func favouriteBreed(byId: UUID) {
        
    }
}
