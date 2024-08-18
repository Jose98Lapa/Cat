//
//  ListViewModel.swift
//  CatMate
//
//  Created by José Miguel Lapa on 18/08/2024.
//

import Foundation

enum ListViewModelType {
    case breedList, favouriteList
}

protocol ListViewModelProtocol {
    
    var breeds: [Breed] { get }
    var listType: ListViewModelType { get }
    func fetchBreeds()
    func favouriteBreed(byId id: UUID)
}

class ListViewModel: ObservableObject, ListViewModelProtocol {

    @Published private(set) var breeds: [Breed] = []
    private let repository: BreedRepository
    let listType: ListViewModelType
    private var page: Int = 0
    private var itemsPerPage: Int = 20
    
    init(repository: BreedRepository, listType: ListViewModelType) {
        self.repository = repository
        self.listType = listType
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
