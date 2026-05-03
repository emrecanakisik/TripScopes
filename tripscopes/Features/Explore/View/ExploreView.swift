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

    //Closures (forwarded from ExploreHeaderCell)
    var onSearchTextChanged: ((String) -> Void)?
    var onSearchSubmitted: ((String) -> Void)?

    //ViewModel
    private let viewModel: ExploreViewModel

    //UI Elements
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero,
                                  collectionViewLayout: createLayout())
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false

        cv.register(ExploreHeaderCell.self,
                    forCellWithReuseIdentifier: ExploreHeaderCell.reuseID)
        cv.register(BookingCardCell.self,
                    forCellWithReuseIdentifier: BookingCardCell.reuseID)
        cv.register(ExploreAISuggestionsCell.self,
                    forCellWithReuseIdentifier: ExploreAISuggestionsCell.reuseID)
        cv.register(ExploreCategoriesRowCell.self,
                    forCellWithReuseIdentifier: ExploreCategoriesRowCell.reuseID)

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

        addSubview(collectionView)

        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(viewPadding)
        }
    }
}
