//
//  AdsListViewController.swift
//  desafio
//
//  Created by Fernando Luiz Goulart on 13/04/21.
//

import UIKit
import ONetwork
import OUIKit
import Reusable

final class AdsListViewController: UIViewController {
    private let interactor: AdsListBussinessLogic
    var viewModel: AdsListViewModel?
    
    lazy var collectionView: UICollectionView  = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: FlowListViewLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: AdListCardViewCell.self)
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
        setupCollectionView()
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view = collectionView
        interactor.fetch()
    }
}

extension AdsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.adsCount ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(for: indexPath, cellType: AdListCardViewCell.self).configure(ad: viewModel?.formatItem(for: indexPath.row))
    }
}

extension AdsListViewController {
    func refeshAds() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func showError(message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
    }
}

