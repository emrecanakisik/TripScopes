//
//  ProfileQuickAccessCell.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 03/05/2026.
//

import Foundation
import UIKit
import SnapKit

class ProfileQuickAccessCell: UICollectionViewCell {

    static let reuseID = "ProfileQuickAccessCell"

//ELEMENTS
    private lazy var menuCardView: ProfileMenuCardView = ProfileMenuCardView()

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
        contentView.addSubview(menuCardView)

        menuCardView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        menuCardView.configure(
            title: "Quick Access",
            rows: [
                ("person.crop.circle.fill", "Personal Information", nil),
                ("creditcard.fill", "Payment Methods", nil),
                ("doc.text.fill", "Travel Documents", nil),
                ("bell.fill", "Notification Preferences", nil),
                ("dollarsign.circle.fill", "Currency", "USD ($)"),
                ("globe", "Language", "English")
            ]
        )
    }
}
