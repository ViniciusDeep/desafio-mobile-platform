//
//  AdsFactoryScene.swift
//  desafio
//
//  Created by Vinicius Mangueira Correa on 27/06/21.
//

import UIKit


struct AdsFactoryScene {
    
    static func make() -> UINavigationController {
        let presenter = AdsListPresenter()
        let interactor = AdsListInteractor(presenter: presenter)
        let viewController = AdsListViewController(interactor: interactor)
        presenter.viewController = viewController
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.navigationBar.barTintColor = .purple
        return navigation
    }
}
