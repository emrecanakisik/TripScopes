//
//  BookingsAccommodationHeaderView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 27/04/2026.
//

import Foundation
import UIKit
import SnapKit

class BookingsAccommodationHeaderView: UIView {

//ELEMENTS
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = UIColor(hex: Colors.tertiary)
        return label
    }()

    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(hex: Colors.primary)
        label.textAlignment = .right
        return label
    }()

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
        titleLabel.text = "Accommodation"
        countLabel.text = "1 BOOKING"

        addSubview(titleLabel)
        addSubview(countLabel)

        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }

        countLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalTo(titleLabel)
            make.leading.greaterThanOrEqualTo(titleLabel.snp.trailing).offset(8)
        }
    }
}
