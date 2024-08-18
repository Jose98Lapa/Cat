//
//  ListViewModel.swift
//  CatMate
//
//  Created by José Miguel Lapa on 18/08/2024.
//

import Foundation

protocol ListViewModelProtocol {
    
    var breeds: [Breed] { get }
    func fetchBreeds()
    func favouriteBreed()
}

class ListViewModel: ObservableObject, ListViewModelProtocol {

    
    @Published private(set) var breeds: [Breed] = []
    
    func fetchBreeds() {
        let breed = Breed()
        breeds.append(breed)
    }
    
    func favouriteBreed() {
    }
}
