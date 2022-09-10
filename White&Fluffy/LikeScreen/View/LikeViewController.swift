//
//  LikeViewController.swift
//  White&Fluffy
//
//  Created by admin on 03.09.2022.
//

import Foundation
import UIKit

final class LikeViewController: UIViewController {
    
    var presenter: LikePresenterProtocol?
    private let likeView = LikeView()
    
    override func loadView() {
        view = likeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTable()
        configureNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.needUpdateCells()
    }
    
}

extension LikeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.modelsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LikeTableCell", for: indexPath) as? LikeTableCell
        else {
            return UITableViewCell()
        }
        if let model = presenter?.likeModel(for: indexPath) {
            cell.update(model: model)
        } else {
            print("Ячейки не заполнились")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let model = presenter?.likeModel(for: indexPath) {
            let infVC = ModuleBuilder.assemblyInformationController(model: model)
            pushModule(withViewController: infVC)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            if let model = self.presenter?.likeModel(for: indexPath) {
                RealmManager.shared.deleteLikeModel(model: model)
                self.presenter?.needUpdateCells()
            }
        }
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [delete])
        return swipeConfiguration
    }
    
}

//MARK: LikeVCProtocol
extension LikeViewController: LikeVCProtocol {
    
    func fetchModel() {
        likeView.tableView.reloadData()
    }
    
}

//MARK: ConfigureTable
private extension LikeViewController {
    
    func configureTable() {
        likeView.tableView.delegate = self
        likeView.tableView.dataSource = self
        likeView.tableView.register(LikeTableCell.self, forCellReuseIdentifier: "LikeTableCell")
        likeView.tableView.separatorStyle = .none
        likeView.tableView.rowHeight = UITableView.automaticDimension
    }
    
    func configureNavBar() {
        title = "Liked photos"
    }
    
}
