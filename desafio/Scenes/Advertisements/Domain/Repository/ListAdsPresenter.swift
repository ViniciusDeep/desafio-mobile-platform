//
//  AdsListPresenter.swift
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
        viewController?.didPresentAds(ads: ads.list_ads ?? [])
    }
    
    func show(error: ProviderError) {
        
    }
}
