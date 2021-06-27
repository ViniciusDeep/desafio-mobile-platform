//
//  AdsList.swift
//  desafioTests
//
//  Created by Vinicius Mangueira Correa on 27/06/21.
//

import XCTest
@testable import desafio

class AdsList: XCTestCase {
    
    lazy var presentationLogicSpy = AdsListPresenter()
    lazy var bussinessLogicSpy = AdsListInteractor(repository: FakeRepository(), presenter: presentationLogicSpy)
    lazy var viewController = AdsListViewController(interactor: bussinessLogicSpy)

}
