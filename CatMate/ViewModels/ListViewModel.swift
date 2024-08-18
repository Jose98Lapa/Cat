//
//  ListViewModel.swift
//  CatMate
//
//  Created by José Miguel Lapa on 18/08/2024.
//

import Foundation

protocol ListViewModelProtocol {
    
    var breeds: [Breed] { get }
    var repository: BreedRepository { get }
    func fetchBreeds()
    func favouriteBreed(byId id: UUID)
}

class ListViewModel: ObservableObject, ListViewModelProtocol {

    @Published private(set) var breeds: [Breed] = []
    private var repository: BreedRepository
    private var page: Int = 0
    private var itemsPerPage: Int = 20
    
    init(repository: BreedRepository) {
        self.repository = repository
    }
    
    func fetchBreeds() {
        let breed = Breed()
        breeds.append(breed)
    }
    
    func favouriteBreed(byId id: UUID) {
        if let indexOfBreed = breeds.firstIndex(where: { $0.id == id }) {
            breeds[indexOfBreed].isFavourite.toggle()
        }
    }
}
