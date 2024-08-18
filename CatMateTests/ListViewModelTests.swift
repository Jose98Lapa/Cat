//
//  CatMateTests.swift
//  CatMateTests
//
//  Created by José Miguel Lapa on 18/08/2024.
//

import Foundation
import Testing
@testable import CatMate

struct ListViewModelTests {
    
    var viewModel: ListViewModel
    
    init() {
        self.viewModel = ListViewModel()
    }

    @Test func fetchBreedsSuccessfully() async throws {
        viewModel.fetchBreeds()
        #expect(!viewModel.breeds.isEmpty)
    }
    
    @Test func favouriteBreedSuccessfully() async throws {
        viewModel.fetchBreeds()
        viewModel.favouriteBreed(byId: UUID(uuidString: "5dd5f046-721e-4769-b0d7-e99c32f84041")!)
        let cat = viewModel.breeds.first(where: { $0.id == UUID(uuidString: "5dd5f046-721e-4769-b0d7-e99c32f84041") })
        #expect(cat?.isFavourite == true)
    }
    
    @Test func favouriteBreedUnsuccessfully() async throws {
        viewModel.fetchBreeds()
        viewModel.favouriteBreed(byId: UUID(uuidString: "5dd5f046-721e-4769-b0d7-e99c32f84042")!)
        let cat = viewModel.breeds.first(where: { $0.id == UUID(uuidString: "5dd5f046-721e-4769-b0d7-e99c32f84042") })
        #expect(cat == nil)
    }
}
