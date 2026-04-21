//
//  HomeViewController.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 18/12/2025.
//

import UIKit
import SnapKit

class ExploreViewController: UIViewController {

    private let viewModel = ExploreViewModel()
    private lazy var mainView = ExploreView(viewModel: viewModel)

    override func viewDidLoad() {
        super.viewDidLoad()

        let pageTitle = CommonTitleView(title: "TripScopes")
        view.addSubview(pageTitle)
        view.addSubview(mainView)

        mainView.onSearchTextChanged = { [weak self] text in
            self?.viewModel.Search(for: text)
        }

        mainView.onSearchSubmitted = { [weak self] text in
            self?.viewModel.Search(for: text)
        }

        viewModel.onSearchResultsUpdated = { [weak self] results in
            print("Results: \(results)")
        }

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
