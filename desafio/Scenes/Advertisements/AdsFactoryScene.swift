//
//  AdsFactoryScene.swift
//  desafio
//
//  Created by Vinicius Mangueira Correa on 27/06/21.
//

import Foundation


struct AdsFactoryScene {
    
    static func make() -> AdsListViewController {
        let presenter = AdsListPresenter()
        let interactor = AdsListInteractor(presenter: presenter)
        
        return AdsListViewController(interactor: interactor)
    }
}
