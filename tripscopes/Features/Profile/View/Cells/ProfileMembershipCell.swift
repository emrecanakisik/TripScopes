//
//  ProfileMembershipCell.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 03/05/2026.
//

import Foundation
import UIKit
import SnapKit

class ProfileMembershipCell: UICollectionViewCell {

    static let reuseID = "ProfileMembershipCell"

//ELEMENTS
    private lazy var membershipCardView: ProfileMembershipCardView = ProfileMembershipCardView()

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
        contentView.addSubview(membershipCardView)

        membershipCardView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
