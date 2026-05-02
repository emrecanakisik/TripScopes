//
//  HomeViewController.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 18/12/2025.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    private let viewModel = ProfileViewModel()
    private lazy var mainView = ProfileView(viewModel: viewModel)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView)
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }

    }

}
