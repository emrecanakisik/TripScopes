//
//  HomeViewController.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 18/12/2025.
//

import UIKit
import SnapKit

class SavedViewController: UIViewController {
    
    private let viewModel = SavedViewModel()
    private lazy var mainView = SavedView(viewModel: viewModel)

    override func viewDidLoad() {
        super.viewDidLoad()
        let pageTitle = CommonTitleView(title: "Saved")
        view.addSubview(pageTitle)
        view.addSubview(mainView)
        
        pageTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(pageTitle.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}
