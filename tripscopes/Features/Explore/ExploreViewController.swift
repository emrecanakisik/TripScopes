//
//  HomeViewController.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 18/12/2025.
//

import UIKit
import SnapKit

class ExploreViewController: UIViewController, UISearchBarDelegate {
    
    private let mainView = ExploreView(frame: .zero)
    private let viewModel = ExploreViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        let pageTitle = CommonTitleView(title: "TripScopes")
        view.addSubview(mainView)
        
        mainView.searchBar.delegate = self
        viewModel.onSearchResultsUpdated = {[weak self] results in
            print("Results: \(results)")
        }
        
        mainView.snp.makeConstraints{make in
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
