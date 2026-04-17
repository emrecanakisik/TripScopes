//
//  ExploreView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 01/04/2026.
//

import Foundation
import UIKit
import SnapKit

class ExploreView: UIView {
    
    let viewPadding: CGFloat = 24
    let itemSpace: CGFloat = 16
    
//ELEMENTS
    let mainLabel = ExploreMainTitle(frame: .zero, labelText: "Where to next?")
    let searchBar = ExploreSearchBar(frame: .zero, placeholderText: "Search destinations, tours or hotels")
    let bookingCards = ExploreHotelsFlightsCardView(frame: .zero, cardType: ExploreCardType.flights, departureCity: "london", arrivalCity: "New York")
    let bookingCards1 = ExploreHotelsFlightsCardView(frame: .zero, cardType: ExploreCardType.hotels, checkInTime: "24 Nov", guestCount: "1")
    let bookingCards2 = ExploreHotelsFlightsCardView(frame: .zero, cardType: ExploreCardType.hotels, checkInTime: "24 Nov", guestCount: "1")
    
//INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//UI SETUP
    private func SetupUI() {
        backgroundColor = UIColor(hex: Colors.neutral100)
        addSubview(mainLabel)
        addSubview(searchBar)
        addSubview(bookingCards)
        addSubview(bookingCards1)
        addSubview(bookingCards2)

        mainLabel.snp.makeConstraints{make in
            make.top.leading.trailing.equalToSuperview().inset(viewPadding)
        }
        
        searchBar.snp.makeConstraints{make in
            make.top.equalTo(mainLabel.snp.bottom).offset(itemSpace)
            make.leading.trailing.equalToSuperview().inset(viewPadding)
        }
        
        bookingCards.snp.makeConstraints{make in
            make.top.equalTo(searchBar.snp.bottom).offset(itemSpace)
            make.leading.trailing.equalToSuperview().inset(viewPadding)
        }
        
        bookingCards1.snp.makeConstraints{make in
            make.top.equalTo(bookingCards.snp.bottom).offset(itemSpace)
            make.leading.trailing.equalToSuperview().inset(viewPadding)
        }
        
        bookingCards2.snp.makeConstraints{make in
            make.top.equalTo(bookingCards1.snp.bottom).offset(itemSpace)
            make.leading.trailing.equalToSuperview().inset(viewPadding)
        }
        
    }
}
