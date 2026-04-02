//
//  ExploreSearch.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 02/04/2026.
//

import Foundation
import UIKit
import SnapKit

class ExploreSearchBar: UISearchBar {
    
//INIT
    var placeholderText: String
    init(frame: CGRect, placeholderText: String) {
        self.placeholderText = placeholderText
        super.init(frame: frame)
        SetupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//UI SETUP
    private func SetupUI() {
        
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium, scale: .large)
        let icon = UIImage(systemName: "globe.americas", withConfiguration: config)
            setImage(icon, for: .search, state: .normal)
            placeholder = placeholderText
            
            searchBarStyle = .minimal
            backgroundImage = UIImage()
            
            backgroundColor = UIColor(hex: Colors.neutral200)
            layer.cornerRadius = 16
            clipsToBounds = true
            
            searchTextField.backgroundColor = .clear
            searchTextField.borderStyle = .none
            
            searchTextField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            searchTextField.textColor = UIColor(hex: Colors.neutral500)
            
            searchTextField.snp.remakeConstraints { make in
                make.edges.equalToSuperview()
            }

    }
}
