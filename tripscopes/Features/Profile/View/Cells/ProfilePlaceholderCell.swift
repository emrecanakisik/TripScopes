//
//  ProfilePlaceholderCell.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 02/05/2026.
//

import Foundation
import UIKit

class ProfilePlaceholderCell: UICollectionViewCell {

    static let reuseID = "ProfilePlaceholderCell"

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
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
}
