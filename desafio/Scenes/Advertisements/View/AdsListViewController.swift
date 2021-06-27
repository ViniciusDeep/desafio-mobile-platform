//
//  AdsListViewController.swift
//  desafio
//
//  Created by Fernando Luiz Goulart on 13/04/21.
//

import UIKit
import ONetwork

public enum ProvideyRouter: String, ProviderEndpoint {
    
    case home = "https://nga.olx.com.br/api/v1.2/public/ads?lim=25&region=11&sort=relevance&state=1&lang=pt"
    public var endpoint: String{
        switch self {
        case .home:
            return rawValue
        }
    }
}

class AdsListViewController: UIViewController {

    // Mark: properties
    
    var ads: [Ad] = []
    lazy private var flowLayout: AdListViewLayout = {
        let layout = AdListViewLayout()
        return layout
    }()
    // Mark: outlets

    @IBOutlet weak var adsCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getAds()
    }
    
    // Mark: REST
    
    private func getAds() {
        let provider = Provider<ListAds>()
        
        provider.request(router: ProvideyRouter.home, withMethod: .get, params: nil) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let ads):
                self.ads = ads.list_ads ?? []
                DispatchQueue.main.async {
                  self.adsCollectionView.reloadData()
                    }
                }
            }
        }
}

// MARK: UICollectionViewDataSource

extension AdsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ads.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = adsCollectionView.dequeueReusableCell(withReuseIdentifier: "AdListCardViewCellIdentifier", for: indexPath) as? AdListCardViewCell, !ads.isEmpty else {
            return UICollectionViewCell()
        }
        cell.configure(ad: ads[indexPath.row])
        return cell
    }
}

// MARK: Setup

extension AdsListViewController {
    
    private func setupUI() {
            adsCollectionView.delegate = self
            adsCollectionView.dataSource = self
            adsCollectionView.collectionViewLayout = flowLayout
            adsCollectionView.register(UINib(nibName: "AdListCardViewCell", bundle: nil), forCellWithReuseIdentifier: "AdListCardViewCellIdentifier")
    }
}
