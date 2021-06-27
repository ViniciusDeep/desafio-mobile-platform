//
//  AdsListEndPoint.swift
//  desafio
//
//  Created by Vinicius Mangueira Correa on 27/06/21.
//

import ONetwork

public enum ProvideyRouter: String, ProviderEndpoint {
    
    case baseURL = "https://nga.olx.com.br/api/v1.2/public/ads?lim=25®ion=11&sort=relevance&state=1&lang=pt"
    public var endpoint: String{
        switch self {
        case .baseURL:
            return rawValue
        }
    }
}
