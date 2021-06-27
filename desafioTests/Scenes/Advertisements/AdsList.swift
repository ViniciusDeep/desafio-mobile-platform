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
    
    func test_scenario_when_failed_to_load_ads_at_controller() {
        viewController.viewDidLoad()
        XCTAssertEqual(viewController.collectionView.numberOfItems(inSection: 0), 0)
    }
    
    
    func test_scenario_when_sucess_to_load_ads_at_controller() {
        let listAds = ListAds(list_ads: [Ad(ad: AdDetail(subject: "mockSubject", thumbnail: nil, prices: nil, locations: [AdLocation(code: nil, key: nil, label: nil, locations: nil)], list_time: AdListTime(label: "mock", value: 1)))])
        
        
        let repository = FakeRepository(with: .withAds(listAds))
        bussinessLogicSpy = AdsListInteractor(repository: repository, presenter: presentationLogicSpy)
        viewController = AdsListViewController(interactor: bussinessLogicSpy)
        
        viewController.viewDidLoad()
        
        XCTAssertNil(viewController.viewModel?.adsCount)
    }
    
    func test_scenario_to_garantee_prensentation_logic_data() {
        let listAds = ListAds(list_ads: [Ad(ad: AdDetail(subject: "mockSubject", thumbnail: nil, prices: nil, locations: [AdLocation(code: nil, key: nil, label: nil, locations: nil)], list_time: AdListTime(label: "mock", value: 1)))])
        self.presentationLogicSpy.viewController = viewController
        self.presentationLogicSpy.show(ads: listAds)
        self.presentationLogicSpy.viewController?.viewDidLoad()
    
        XCTAssertEqual(self.presentationLogicSpy.viewController?.viewModel?.adsCount, 1)
        XCTAssertEqual( self.presentationLogicSpy.viewController?.viewModel?.formatItem(for: 0).ad.subject, listAds.list_ads?[0].ad.subject)
        XCTAssertEqual( self.presentationLogicSpy.viewController?.viewModel?.formatItem(for: 0).ad.list_time.label, listAds.list_ads?[0].ad.list_time.label)
    }
}
