//
//  SavedView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 29/04/2026.
//

import Foundation
import UIKit
import SnapKit

class SavedView: UIView {

    //Constants
    private let viewPadding: CGFloat = 24

    //ViewModel
    private let viewModel: SavedViewModel

//ELEMENTS
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero,
                                  collectionViewLayout: createLayout())
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false

        cv.register(SavedFilterTabsCell.self, forCellWithReuseIdentifier: SavedFilterTabsCell.reuseID)
        cv.register(DreamStaysCell.self, forCellWithReuseIdentifier: DreamStaysCell.reuseID)
        cv.register(TrackedFlightsCell.self, forCellWithReuseIdentifier: TrackedFlightsCell.reuseID)
        cv.register(CuratedListsCell.self, forCellWithReuseIdentifier: CuratedListsCell.reuseID)

        cv.dataSource = self
        return cv
    }()

//INIT
    init(viewModel: SavedViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupUI()
    }

    override init(frame: CGRect) {
        self.viewModel = SavedViewModel()
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//UI SETUP
    private func setupUI() {
        backgroundColor = UIColor(hex: Colors.neutral100)

        addSubview(collectionView)

        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
