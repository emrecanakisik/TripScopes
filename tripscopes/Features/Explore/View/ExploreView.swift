//
//  ExploreView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 01/04/2026.
//

import Foundation
import UIKit
import SnapKit

class ExploreView: UIView {

    //Constants
    private let viewPadding: CGFloat = 24
    private let itemSpacing: CGFloat = 16

    //ViewModel
    private let viewModel: ExploreViewModel

    //UI Elements
    let mainLabel = ExploreMainTitle(frame: .zero, labelText: "Where to next?")

    let searchBar = ExploreSearchBar(frame: .zero,
                                     placeholderText: "Search destinations, tours or hotels")

    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero,
                                  collectionViewLayout: createLayout())
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false

        cv.register(BookingCardCell.self,
                    forCellWithReuseIdentifier: BookingCardCell.reuseID)

        cv.dataSource = self
        return cv
    }()

    //Init
    init(viewModel: ExploreViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupUI()
    }
    
    override init(frame: CGRect) {
        self.viewModel = ExploreViewModel()
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //UISetup
    private func setupUI() {
        backgroundColor = UIColor(hex: Colors.neutral100)

        addSubview(mainLabel)
        addSubview(searchBar)
        addSubview(collectionView)

        mainLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(viewPadding)
        }

        searchBar.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(itemSpacing)
            make.leading.trailing.equalToSuperview().inset(viewPadding)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(itemSpacing)
            make.leading.trailing.equalToSuperview().inset(viewPadding)
            make.bottom.equalToSuperview()
        }
    }
}
