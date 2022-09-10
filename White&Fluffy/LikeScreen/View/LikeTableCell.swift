//
//  LikeTableCell.swift
//  White&Fluffy
//
//  Created by admin on 06.09.2022.
//

import Foundation
import UIKit
import Kingfisher

class LikeTableCell: UITableViewCell {
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemPink
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        selectionStyle = .none
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [photoImageView, nameLabel].forEach { subview in contentView.addSubview(subview) }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            photoImageView.heightAnchor.constraint(equalToConstant: 80),
            photoImageView.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: photoImageView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 40),
            nameLabel.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    func update(model: LikeModel) {
        let photo = model.smallImageURL
        let photoURL = URL(string: photo)
        
        photoImageView.kf.setImage(with: photoURL)
        nameLabel.text = model.authorName
    }
    
}
