//
//  ProfileGetHelpCell.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 03/05/2026.
//

import Foundation
import UIKit
import SnapKit

class ProfileGetHelpCell: UICollectionViewCell {

    static let reuseID = "ProfileGetHelpCell"

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
            title: "Get Help",
            rows: [
                ("questionmark.circle.fill", "Help Center", nil),
                ("bubble.left.and.bubble.right.fill", "Contact Support", nil),
                ("square.and.pencil", "Share Feedback", nil),
                ("doc.text.fill", "Terms & Privacy", nil)
            ]
        )
    }
}
