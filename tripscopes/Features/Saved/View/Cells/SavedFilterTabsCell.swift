//
//  SavedFilterTabsCell.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 30/04/2026.
//

import Foundation
import UIKit
import SnapKit

class SavedFilterTabsCell: UICollectionViewCell {

    static let reuseID = "SavedFilterTabsCell"

//ELEMENTS
    private lazy var tabsControl = SavedFilterTabsControl()

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
        contentView.addSubview(tabsControl)

        tabsControl.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
