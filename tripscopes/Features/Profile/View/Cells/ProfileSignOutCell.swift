//
//  ProfileSignOutCell.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 03/05/2026.
//

import Foundation
import UIKit
import SnapKit

class ProfileSignOutCell: UICollectionViewCell {

    static let reuseID = "ProfileSignOutCell"

//ELEMENTS
    private lazy var signOutButton: ProfileSignOutButtonView = ProfileSignOutButtonView()

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
        contentView.addSubview(signOutButton)

        signOutButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
