//
//  BreedRepositoryTests.swift
//  CatMateTests
//
//  Created by José Miguel Lapa on 18/08/2024.
//

import Testing

struct BreedRepositoryTests {
    
    var repository: BreedRepositoryProtocol
    var cacheWorker: CacheWorkerProtocol
    var netWorker: NetWorkerProtocol
    
    init() {
        self.cacheWorker = MockCacheWorker()
        self.netWorker = MockNetWorker()
        self.repository = BreedRepository(netWorker: netWorker, cacheWorker: cacheWorker)
    }

    @Test func fetchBreedsSuccessfully() async throws {
        let breeds = repository.fetchBreeds()
        #expect(!breeds.isEmpty)
    }
}
