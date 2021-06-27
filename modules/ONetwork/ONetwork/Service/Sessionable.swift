//
//  Sessionable.swift
//  ONetwork
//
//  Created by Vinicius Mangueira Correa on 26/06/21.
//

import Foundation

public protocol Sessionable {
    func dataTask(with url: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> DataTaskSessionable
}

public protocol DataTaskSessionable {
    func resume()
}

extension URLSessionDataTask: DataTaskSessionable { }

extension URLSession: Sessionable {
    public func dataTask(with url: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> DataTaskSessionable {
        return dataTask(with: url, completionHandler: completion)
    }
}

