//
//  InformationVC.swift
//  White&Fluffy
//
//  Created by admin on 05.09.2022.
//

import Foundation
import UIKit

final class InformationViewController: UIViewController {
    
    var presenter: InformationPresenterProtocol?
    private let informationView = InformationView()
    private var likeFlag = true
    
    override func loadView() {
        view = informationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        configureDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavBar(hidden: true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureNavBar(hidden: false, animated: animated)
    }
    
}

//MARK: InformationVCProtocol
extension InformationViewController: InformationVCProtocol {
    func setupView(viewModel: InformationViewModel) {
        informationView.updateInformationWithCodable(viewModel: viewModel)
    }
}

//MARK: InformationViewDelegate
extension InformationViewController: InformationViewDelegate {
    
    func heartImageTapped(imageView: UIImageView) {
        imageView.tintColor = likeFlag ? .red : .gray
        if imageView.tintColor == .gray {
            Alerts.getAlertLikedImageTapped(message: "This photo has been removed from the liked photos section")
            if let presenter = presenter {
                presenter.deletedInformation()
            }
        } else {
            Alerts.getAlertLikedImageTapped(message: "This photo has been added to the liked photos section")
            if let presenter = presenter {
                presenter.savedInformation()
            }
        }
        likeFlag.toggle()
    }
    
    private func configureDelegate() {
        informationView.delegateLikeImage = self
    }
    
}

//MARK: ConfigureNavBar, ConfigurePresenter
private extension InformationViewController {
    
    func configureNavBar(hidden: Bool, animated: Bool) {
        navigationController?.setNavigationBarHidden(hidden, animated: animated)
    }
}
