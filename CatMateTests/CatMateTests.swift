//
//  CatMateTests.swift
//  CatMateTests
//
//  Created by José Miguel Lapa on 18/08/2024.
//

import Testing
@testable import CatMate

struct ListViewModelTests {
    
    var viewmodel: ListViewModel

    @Test func fetchBreedsSuccessfully() async throws {
        viewmodel.fetchBreeds()
        #expect(!viewmodel.breeds.isEmpty)
    }
}
