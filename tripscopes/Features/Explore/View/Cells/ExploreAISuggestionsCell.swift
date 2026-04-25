//
//  ExploreAITripSuggestionsCell.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 24/04/2026.
//

import Foundation
import UIKit
import SnapKit

class ExploreAISuggestionsCell: UICollectionViewCell {
    
    static let reuseID = "AISuggestionsCell"
    
// ELEMENTS
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "sparkles")
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "AI Trip Suggestions"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .darkText
        return label
    }()
    
    private lazy var viewAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("View all", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        return button
    }()

    private lazy var aiSuggestionCardsView = AISuggestionCardsView()
    
// INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// UI SETUP
    private func setupUI() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(viewAllButton)
        contentView.addSubview(aiSuggestionCardsView)
        
        iconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().inset(16)
            make.width.height.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(8)
            make.centerY.equalTo(iconImageView)
        }
        
        viewAllButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalTo(iconImageView)
            make.leading.greaterThanOrEqualTo(titleLabel.snp.trailing).offset(8)
        }
        
        aiSuggestionCardsView.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
}
