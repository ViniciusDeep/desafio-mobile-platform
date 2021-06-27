//
//  AdsListViewController.swift
//  desafio
//
//  Created by Fernando Luiz Goulart on 13/04/21.
//

import UIKit
import ONetwork



class AdsListViewController: UIViewController {

    // Mark: properties
    
    private let interactor: AdsListBussinessLogic
    
    var ads: [Ad] = []
    lazy private var flowLayout: AdListViewLayout = {
        let layout = AdListViewLayout()
        return layout
    }()
    
    lazy var collectionView: UICollectionView  = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "AdListCardViewCell", bundle: nil), forCellWithReuseIdentifier: "AdListCardViewCellIdentifier")
        return collectionView
    }()
    
    init(interactor: AdsListBussinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        interactor.fetch()
    }
}

// MARK: UICollectionViewDataSource

extension AdsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ads.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdListCardViewCellIdentifier", for: indexPath) as? AdListCardViewCell, !ads.isEmpty else {
            return UICollectionViewCell()
        }
        cell.configure(ad: ads[indexPath.row])
        return cell
    }
}

// MARK: Setup

extension AdsListViewController {
    
    private func setupUI() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view = collectionView
    }
}


extension AdsListViewController {
    
    func didPresentAds(ads: [Ad]) {
        self.ads = ads
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

