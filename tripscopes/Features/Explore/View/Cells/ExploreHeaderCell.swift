//
//  ExploreHeaderCell.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 21/04/2026.
//

import Foundation
import UIKit
import SnapKit

class ExploreHeaderCell: UICollectionViewCell, UISearchBarDelegate {

    // Reuse ID
    static let reuseID = "ExploreHeaderCell"

    // Closures
    var onSearchTextChanged: ((String) -> Void)?
    var onSearchSubmitted: ((String) -> Void)?

    // UI Elements
    let mainLabel = ExploreMainTitle(frame: .zero, labelText: "Where to next?")

    let searchBar = ExploreSearchBar(
        frame: .zero,
        placeholderText: "Search destinations, tours or hotels"
    )

    // Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        onSearchTextChanged?(searchText)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        onSearchSubmitted?(searchBar.text ?? "")
    }

    // Setup
    private func setupUI() {
        searchBar.delegate = self
        contentView.addSubview(mainLabel)
        contentView.addSubview(searchBar)

        mainLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }

        searchBar.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
