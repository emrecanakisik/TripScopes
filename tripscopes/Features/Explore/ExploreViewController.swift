//
//  HomeViewController.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 18/12/2025.
//

import UIKit
import SnapKit

class ExploreViewController: UIViewController, UISearchBarDelegate {

    private let viewModel = ExploreViewModel()
    private lazy var mainView = ExploreView(viewModel: viewModel)

    override func viewDidLoad() {
        super.viewDidLoad()

        let pageTitle = CommonTitleView(title: "TripScopes")
        view.addSubview(pageTitle)
        view.addSubview(mainView)

        mainView.searchBar.delegate = self

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

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.Search(for: searchText)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        viewModel.Search(for: searchBar.text ?? "")
    }
}
