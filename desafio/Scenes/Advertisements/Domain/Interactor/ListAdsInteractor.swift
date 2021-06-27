//
//  AdsListInteractor.swift
//  desafio
//
//  Created by Vinicius Mangueira Correa on 27/06/21.
//

import ONetwork


protocol AdsListBussinessLogic {
    func fetch()
}

final class AdsListInteractor {
    
    let repository: AdsListConfigurableRepository
    let presenter: AdsListPresentationLogic
    
    init(repository: AdsListConfigurableRepository = AdsListRepository(),
         presenter: AdsListPresentationLogic = AdsListPresenter()) {
        self.repository = repository
        self.presenter = presenter
    }
}


extension AdsListInteractor: AdsListBussinessLogic {
    func fetch() {
        repository.fetchAds { (result) in
            switch result {
            case .failure(let error):
                self.presenter.show(error: error)
            case .success(let ads):
                self.presenter.show(ads: ads)
            }
        }
    }
}
