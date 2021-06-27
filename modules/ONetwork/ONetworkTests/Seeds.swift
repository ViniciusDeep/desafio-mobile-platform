//
//  Seeds.swift
//  ONetworkTests
//
//  Created by Vinicius Mangueira Correa on 26/06/21.
//

import Foundation
@testable import ONetwork

class DataTaskSpy: DataTaskSessionable {
    
    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
    var data: Data?
    var urlResponse: URLResponse?
    var error: Error?
    
    init(data: Data?) {
        self.data = data
    }
    
    func resume() {
        completionHandler?(data, urlResponse, error)
    }
}

class SessionSpy: Sessionable {
    
    var dataTask: DataTaskSpy
    
    init(dataTask: DataTaskSpy) {
        self.dataTask = dataTask
    }
    
    func dataTask(with url: URLRequest, completion completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> DataTaskSessionable {
        dataTask.completionHandler = completionHandler
        return dataTask
    }
}
