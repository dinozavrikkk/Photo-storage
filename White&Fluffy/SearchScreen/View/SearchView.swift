//
//  SearchView.swift
//  White&Fluffy
//
//  Created by admin on 03.09.2022.
//

import Foundation
import UIKit

final class SearchView: UIView {
    
    private(set) var searchBar = UISearchBar()
    
    private(set) var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width) / 2 - 6, height: 200)
        flowLayout.minimumLineSpacing = 4
        flowLayout.minimumInteritemSpacing = 4
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = UIColor.clear
        view.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [collectionView].forEach { subview in addSubview(subview) }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -4)
        ])
    }
    
}
