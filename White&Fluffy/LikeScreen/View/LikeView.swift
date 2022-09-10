//
//  LikeView.swift
//  White&Fluffy
//
//  Created by admin on 06.09.2022.
//

import Foundation
import UIKit

final class LikeView: UIView {
    
    private(set) var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.backgroundColor = UIColor.clear
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
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
        [tableView].forEach { subview in addSubview(subview)}
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -4)
        ])
    }
}
