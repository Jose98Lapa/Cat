//
//  ListViewModel.swift
//  CatMate
//
//  Created by José Miguel Lapa on 18/08/2024.
//

import Foundation

protocol ListViewModelProtocol: {
    
    func fetchBreeds() -> [Breed]
    func favouriteBreed() -> Breed?
}

struct ListViewModel: ObservableObject {
    
}
