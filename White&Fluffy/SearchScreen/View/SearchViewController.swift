//
//  SearchViewController.swift
//  White&Fluffy
//
//  Created by admin on 03.09.2022.
//

import Foundation
import UIKit

final class SearchViewController: UIViewController {
    
    var presenter: SearchPresenterProtocol?
    private let searchView = SearchView()
    private var searchBarText = "random"
    
    override func loadView() {
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        configureCollection()
        presenter?.viewIsReady(text: searchBarText)
    }
    
}

//MARK: UICollectionViewDelegate, UICollectionViewDataSource
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.photoCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as? SearchCell
        else {
            return UICollectionViewCell()
        }
        if let model = presenter?.photo(for: indexPath) {
            cell.update(model: model)
        } else {
            print("Ячейки не заполнились")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let numberOfCellsAtTheBottomOfTheTable = 2
        guard indexPath.item + numberOfCellsAtTheBottomOfTheTable >= presenter?.photoCount ?? 0 else { return }
        presenter?.viewWillReachPhotoLimit(text: searchBarText)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let model = presenter?.photo(for: indexPath) {
            let infVC = ModuleBuilder.assemblyInformationController(model: model)
            pushModule(withViewController: infVC)
        }
    }
    
}

//MARK: UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text {
            searchBarText = text
            presenter?.viewNeedUpdateData(text: text)
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchView.searchBar.endEditing(true)
    }
    
}

//MARK: SearchVCProtocol
extension SearchViewController: SearchVCProtocol {
    
    func fetchModelAfterSearchBarClicked() {
        searchView.collectionView.reloadData()
    }
    
    func fetchModel() {
        searchView.collectionView.reloadData()
    }
    
}

//MARK: ConfigureCollection, ConfigureNavBar
private extension SearchViewController {
    
    func configureCollection() {
        searchView.collectionView.delegate = self
        searchView.collectionView.dataSource = self
        searchView.collectionView.register(SearchCell.self, forCellWithReuseIdentifier: "SearchCell")
    }
    
    func configureNavBar() {
        title = "Search"
        navigationItem.titleView = searchView.searchBar
        searchView.searchBar.delegate = self
    }
    
}
