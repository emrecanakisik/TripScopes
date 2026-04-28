//
//  UpcomingFlightsCell.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 27/04/2026.
//

import Foundation
import UIKit
import SnapKit

class BookingsFlightsCell: UICollectionViewCell {

    static let reuseID = "UpcomingFlightsCell"

//ELEMENTS
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()

    private lazy var headerView = BookingsSectionHeaderView(title: "Upcoming Flights", count: "2 BOOKINGS")
    private lazy var firstCard = BookingFlightCardView()
    private lazy var secondCard = BookingFlightCardView()

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
        contentView.addSubview(stackView)

        stackView.addArrangedSubview(headerView)
        stackView.setCustomSpacing(16, after: headerView)
        stackView.addArrangedSubview(firstCard)
        stackView.addArrangedSubview(secondCard)

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
