//
//  BookingBannerCell.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 28/04/2026.
//

import Foundation
import UIKit
import SnapKit

class BookingBannerCell: UICollectionViewCell {

    static let reuseID = "BookingBannerCell"

//ELEMENTS
    private lazy var bannerView: BookingBannerView = BookingBannerView(style: .concierge)

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
        contentView.addSubview(bannerView)

        bannerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

//CONFIGURE
    func configure(with style: BookingBannerStyle) {
        bannerView.apply(style: style)
    }
}
