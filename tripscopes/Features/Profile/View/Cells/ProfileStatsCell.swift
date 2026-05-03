//
//  ProfileStatsCell.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 03/05/2026.
//

import Foundation
import UIKit
import SnapKit

class ProfileStatsCell: UICollectionViewCell {

    static let reuseID = "ProfileStatsCell"

//ELEMENTS
    private lazy var statsCardView: ProfileStatsCardView = ProfileStatsCardView()

//INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//UI SETUP
    private func setupUI() {
        contentView.addSubview(statsCardView)

        statsCardView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
