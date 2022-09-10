//
//  SearchCell.swift
//  White&Fluffy
//
//  Created by admin on 03.09.2022.
//

import Foundation
import UIKit
import Kingfisher

final class SearchCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    private func addSubviews() {
        [imageView].forEach { subview in contentView.addSubview(subview) }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func update(model: ResultPhoto) {
        guard let photo = model.urls?.regular,
              let photoURL = URL(string: photo)
        else { return }
        imageView.kf.setImage(with: photoURL)
    }
    
}
