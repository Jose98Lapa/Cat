//
//  CatMateTests.swift
//  CatMateTests
//
//  Created by José Miguel Lapa on 18/08/2024.
//

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
}
