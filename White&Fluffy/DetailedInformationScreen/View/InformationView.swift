//
//  InformationView.swift
//  White&Fluffy
//
//  Created by admin on 05.09.2022.
//

import Foundation
import UIKit
import Kingfisher

final class InformationView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private lazy var heartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "heart.fill")
        imageView.tintColor = .gray
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(heartDidTap))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let authorsNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemPink
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateOfCreationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemPink
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionPhotoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemPink
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let likesPhotoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemPink
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var horizontStack: UIStackView = {
        let stack = UIStackView()
        [authorsNameLabel, dateOfCreationLabel, descriptionPhotoLabel, likesPhotoLabel].forEach { stack.addArrangedSubview($0) }
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    weak var delegateLikeImage: InformationViewDelegate?
    
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
        [imageView, heartImageView, horizontStack].forEach { subview in addSubview(subview) }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            imageView.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            heartImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            heartImageView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            heartImageView.heightAnchor.constraint(equalToConstant: 30),
            heartImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            horizontStack.topAnchor.constraint(equalTo: heartImageView.bottomAnchor, constant: 12),
            horizontStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            horizontStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            horizontStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)
        ])
    }
    
    func setHeartTintColor(flag: inout Bool) {
        heartImageView.tintColor = .red
        flag.toggle()
    }
    
    func updateInformationWithCodable<T: Codable>(model: T) {
        if let model = model as? ResultPhoto {
            guard let photo = model.urls?.regular,
                  let photoURL = URL(string: photo),
                  let name = model.user?.name,
                  let date = model.created_at,
                  let like = model.likes
            else { return }
            let formattedDate = dateFromApiString(date)
            
            imageView.kf.setImage(with: photoURL)
            authorsNameLabel.text = "Author's name: \(name)"
            dateOfCreationLabel.text = "Date the photo was created: \(formattedDate)"
            descriptionPhotoLabel.text = "Photo description: \(model.description ?? "The author of this photo did not write a description")"
            likesPhotoLabel.text = "Like: \(like)"
        } else {
            if let model = model as? LikeModel {
                let photoURL = URL(string: model.regularImageURL)
                let formattedDate = dateFromApiString(model.date)
                
                imageView.kf.setImage(with: photoURL)
                authorsNameLabel.text = "Author's name: \(model.authorName)"
                dateOfCreationLabel.text = "Date the photo was created: \(formattedDate)"
                descriptionPhotoLabel.text = "Photo description: \(model.descript)"
                likesPhotoLabel.text = "Like: \(model.likes)"
            }
        }
    }
    
}

private extension InformationView {
    
    @objc func heartDidTap() {
        delegateLikeImage?.heartImageTapped(imageView: heartImageView)
    }
    
    func dateFromApiString(_ eventDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: eventDate) ?? Date()
        dateFormatter.setLocalizedDateFormatFromTemplate("dd MMMM yyyy HH:mm")
        return dateFormatter.string(from: date)
    }
    
}
