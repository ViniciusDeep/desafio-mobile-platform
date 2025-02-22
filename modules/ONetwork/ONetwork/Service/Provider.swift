//
//  Service.swift
//  ONetwork
//
//  Created by Vinicius Mangueira Correa on 26/06/21.
//

import Foundation

public enum ProviderMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public enum ProviderError: Error {
    case cannotLoadData
    case cannotDecodedData
}

public struct Provider<T: Decodable> {
    
    let session: Sessionable
    
    public init(session: Sessionable = URLSession.shared) {
        self.session = session
    }
    
    public func request(router: ProviderEndpoint, withMethod method: ProviderMethod, params: [String : Any]?, completion: @escaping (Result<T, ProviderError>) -> () ) {
        method.request(session: self.session,router: router, params: params) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                do {
                    let refund = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {completion(.success(refund))}
                } catch {
                    DispatchQueue.main.async {completion(.failure(.cannotDecodedData))}
                }
            }
        }
    }
}

extension ProviderMethod {
    public func request(session: Sessionable,router: ProviderEndpoint, params: [String: Any]?, completion: @escaping (Result<Data, ProviderError>)-> ()) {
        guard let url = URL(string: router.endpoint) else {return}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = rawValue
        
        do {
        
            if let dicParams = params {
                let data = try JSONSerialization.data(withJSONObject: dicParams, options: .init())
                urlRequest.httpBody = data
                urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
            }
            
           session.dataTask(with: urlRequest) { (data, _, err) in
            if err != nil { completion(.failure(.cannotLoadData))}
                guard let data = data else {return print("Does not load data")}
                completion(.success(data))
            }.resume()
        } catch {
            completion(.failure(.cannotLoadData))
        }
    }
}

public protocol ProviderEndpoint{
    var endpoint: String{ get }
}

