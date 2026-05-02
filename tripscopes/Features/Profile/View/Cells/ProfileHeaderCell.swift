//
//  ProfileHeaderCell.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 02/05/2026.
//

import Foundation
import UIKit
import SnapKit

class ProfileHeaderCell: UICollectionViewCell {

    static let reuseID = "ProfileHeaderCell"

//ELEMENTS
    private lazy var headerCardView: ProfileHeaderCardView = ProfileHeaderCardView()

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
        contentView.addSubview(headerCardView)

        headerCardView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
