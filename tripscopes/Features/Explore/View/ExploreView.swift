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
        
        mainLabel.snp.makeConstraints{make in
            make.top.leading.trailing.equalToSuperview().inset(viewPadding)
        }
        
        searchBar.snp.makeConstraints{make in
            make.top.equalTo(mainLabel.snp.bottom).offset(itemSpace)
            make.leading.trailing.equalToSuperview().inset(viewPadding)
        }
    }
}
