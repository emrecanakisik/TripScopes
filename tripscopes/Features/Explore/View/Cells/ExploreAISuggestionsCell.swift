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
        
        iconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
            make.top.bottom.equalToSuperview().inset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
        }
        
        viewAllButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.greaterThanOrEqualTo(titleLabel.snp.trailing).offset(8)
        }
    }
    
}
