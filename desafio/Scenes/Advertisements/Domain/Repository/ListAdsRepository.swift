//
//  AdsListRepository.swift
//  desafio
//
//  Created by Vinicius Mangueira Correa on 27/06/21.
//

import Foundation
import ONetwork

protocol AdsListConfigurableRepository {
    func fetchAds(completion: @escaping (Result<ListAds, ProviderError>) -> ())
}

struct AdsListRepository: AdsListConfigurableRepository {
    
    func fetchAds(completion: @escaping (Result<ListAds, ProviderError>) -> ()) {
        let provider = Provider<ListAds>()
        
        provider.request(router: ProvideyRouter.home, withMethod: .get, params: nil) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let ads):
                completion(.success(ads))
            }
        }
    }
}
