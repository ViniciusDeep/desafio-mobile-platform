//
//  AdsListViewModel.swift
//  desafio
//
//  Created by Vinicius Mangueira Correa on 27/06/21.
//

import Foundation

struct AdsListViewModel {
    
    let ads: [Ad]
    
    var adsCount: Int {
        return self.ads.count
    }
    
    func formatItem(for index: Int) -> Ad  { self.ads[index] }
}
