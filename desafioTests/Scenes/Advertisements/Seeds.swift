//
//  Seeds.swift
//  desafioTests
//
//  Created by Vinicius Mangueira Correa on 27/06/21.
//

import Foundation
@testable import desafio
import ONetwork

final class FakeRepository: AdsListConfigurableRepository {
    
    enum FakeRepositoryTestScenario {
        case withAds(ListAds)
        case withError(ProviderError)
    }
    
    var scenario: FakeRepositoryTestScenario = .withError(.cannotLoadData)
    
    init(with scenario: FakeRepositoryTestScenario = .withError(.cannotLoadData) ) {
        self.scenario = scenario
    }
    
    
    func fetchAds(completion: @escaping (Result<ListAds, ProviderError>) -> ()) {
        switch scenario {
        case .withAds(let ads):
            completion(.success(ads))
        case .withError(let error):
            completion(.failure(error))
        }
    }
}
