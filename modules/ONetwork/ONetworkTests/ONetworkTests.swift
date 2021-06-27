//
//  ONetworkTests.swift
//  ONetworkTests
//
//  Created by Vinicius Mangueira Correa on 26/06/21.
//

import XCTest
@testable import ONetwork

struct FakeModel: Decodable {
    let id: Int
    let name: String
}

class ONetworkTests: XCTestCase {

    func test_failure_scenario_to_fetch() {
        var mockData: Data? {
            """
            [{
              "id": 2,
              "name": "Resident Evil Vilage"
            }]
            """.data(using: .utf8)
        }
        
        enum ProvideyRouter: String, ProviderEndpoint {
            case home = "www.any.com/home" // Something to test
            public var endpoint: String{
                switch self {
                case .home:
                    return rawValue
                }
            }
        }
        
        let sessionSpy = SessionSpy(dataTask: DataTaskSpy(data: mockData))
      
        let expectation = XCTestExpectation(description: "Should show error to fetch fake model")
        
        Provider<FakeModel>(session: sessionSpy).request(router: ProvideyRouter.home, withMethod: .get, params: nil) { (result) in
            switch result {
            case .failure:
                expectation.fulfill()
            case .success(let fakeModel):
                XCTFail("Did not load \(fakeModel)")
            
            }
        }
        wait(for: [expectation], timeout: 1.0)
    }
}



