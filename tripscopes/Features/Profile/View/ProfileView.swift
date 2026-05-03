//
//  ProfileView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 02/05/2026.
//

import Foundation
import UIKit
import SnapKit

class ProfileView: UIView {

    //Constants
    private let viewPadding: CGFloat = 24

    //ViewModel
    private let viewModel: ProfileViewModel

//ELEMENTS
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero,
                                  collectionViewLayout: createLayout())
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false

        cv.register(ProfileHeaderCell.self, forCellWithReuseIdentifier: ProfileHeaderCell.reuseID)
        cv.register(ProfileStatsCell.self, forCellWithReuseIdentifier: ProfileStatsCell.reuseID)
        cv.register(ProfilePlaceholderCell.self, forCellWithReuseIdentifier: ProfilePlaceholderCell.reuseID)

        cv.dataSource = self
        return cv
    }()

//INIT
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupUI()
    }

    override init(frame: CGRect) {
        self.viewModel = ProfileViewModel()
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
