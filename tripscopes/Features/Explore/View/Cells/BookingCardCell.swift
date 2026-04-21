//
//  BookingCardCell.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 21/04/2026.
//

import Foundation
import UIKit
import SnapKit

class BookingCardCell: UICollectionViewCell {

    // Reuse ID
    static let reuseID = "BookingCardCell"

    // UI Elements
    private let flightCard = ExploreHotelsFlightsCardView(
        frame: .zero,
        cardType: .flights,
        departureCity: "",
        arrivalCity: ""
    )

    private let hotelCard = ExploreHotelsFlightsCardView(
        frame: .zero,
        cardType: .hotels,
        checkInTime: "",
        guestCount: ""
    )

    // Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Setup
    private func setupUI() {
        contentView.addSubview(flightCard)
        contentView.addSubview(hotelCard)

        flightCard.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }

        hotelCard.snp.makeConstraints { make in
            make.top.equalTo(flightCard.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    // Configure
    func configure(flight: FlightInfo, hotel: HotelInfo) {
        flightCard.updateFlight(departureCity: flight.departureCity,
                                arrivalCity: flight.arrivalCity)
        hotelCard.updateHotel(checkInTime: hotel.checkInDate,
                              guestCount: hotel.guestCount)
    }
}
