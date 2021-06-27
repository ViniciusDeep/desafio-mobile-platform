//
//  Presenter.swift
//  desafio
//
//  Created by Vinicius Mangueira Correa on 27/06/21.
//

import ONetwork

protocol AdsListPresentationLogic: AnyObject {
    var viewController: AdsListViewController? { get set }
    func show(ads: ListAds)
    func show(error: ProviderError)
}

final class AdsListPresenter {
    weak var viewController: AdsListViewController?
}

extension AdsListPresenter: AdsListPresentationLogic {
    func show(ads: ListAds) {
        viewController?.viewModel = AdsListViewModel(ads: ads.list_ads ?? [])
        viewController?.refeshAds()
       
    }
    
    func show(error: ProviderError) {
        switch error {
        case .cannotDecodedData:
            viewController?.showError(message: "Parece que tivemos um problema ao carregar seus dados", title: "Ops")
        case .cannotLoadData:
            viewController?.showError(message: "Parece que tivemos um problema interno no servidor", title: "Ops")
        }
    }
}
