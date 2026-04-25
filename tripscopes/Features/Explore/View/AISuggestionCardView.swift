//
//  AISuggestionCardView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 25/04/2026.
//

import Foundation
import UIKit
import SnapKit

class AISuggestionCardsView: UIView {
    
// ELEMENTS
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var subStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()
    
// INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// UI SETUP
    private func SetupUI(){
        addSubview(mainStackView)
        
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let mainCard = createSuggestionCard(
            isMain: true,
            title: "Paris Adventure",
            subtitle: "4 Days • Cultural Immersion",
            tagName: "ROMANTIC",
            tagColor: .systemBlue,
            imageName: "paris_dummy"
        )
        
        mainCard.snp.makeConstraints { make in
            make.height.equalTo(300)
        }
        
        let subCard1 = createSuggestionCard(
            isMain: false,
            title: "Icelandic Wild",
            subtitle: nil,
            tagName: "TRENDING",
            tagColor: .systemOrange,
            imageName: "iceland_dummy"
        )
        
        let subCard2 = createSuggestionCard(
            isMain: false,
            title: "Bali Retreat",
            subtitle: nil,
            tagName: "POPULAR",
            tagColor: .systemTeal,
            imageName: "bali_dummy"
        )
        
        subCard1.snp.makeConstraints { make in
            make.height.equalTo(200)
        }
        subCard2.snp.makeConstraints { make in
            make.height.equalTo(200)
        }
        
        subStackView.addArrangedSubview(subCard1)
        subStackView.addArrangedSubview(subCard2)
        
        mainStackView.addArrangedSubview(mainCard)
        mainStackView.addArrangedSubview(subStackView)
    }
    
// REUSABLE CARD BUILDER
    private func createSuggestionCard(isMain: Bool, title: String, subtitle: String?, tagName: String, tagColor: UIColor, imageName: String) -> UIView {
        let cardView = UIView()
        cardView.backgroundColor = .systemGray5
        cardView.layer.cornerRadius = 24
        cardView.clipsToBounds = true
        cardView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCardTap(_:)))
        cardView.addGestureRecognizer(tapGesture)
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: imageName) // Dummy image
        cardView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let overlayView = UIView()
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        cardView.addSubview(overlayView)
        overlayView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let contentStack = UIStackView()
        contentStack.axis = .vertical
        contentStack.alignment = .leading
        contentStack.spacing = isMain ? 8 : 4
        cardView.addSubview(contentStack)
        
        contentStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(isMain ? 24 : 16)
        }
        
        let tagContainer = UIView()
        tagContainer.backgroundColor = tagColor
        tagContainer.layer.cornerRadius = 6
        tagContainer.clipsToBounds = true
        
        let tagLabel = UILabel()
        tagLabel.text = tagName
        tagLabel.textColor = .white
        tagLabel.font = .systemFont(ofSize: 10, weight: .bold)
        
        tagContainer.addSubview(tagLabel)
        tagLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(4)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        contentStack.addArrangedSubview(tagContainer)
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: isMain ? 24 : 16, weight: .bold)
        titleLabel.numberOfLines = 2
        contentStack.addArrangedSubview(titleLabel)
        
        if let subtitle = subtitle {
            let subtitleLabel = UILabel()
            subtitleLabel.text = subtitle
            subtitleLabel.textColor = UIColor.white.withAlphaComponent(0.8)
            subtitleLabel.font = .systemFont(ofSize: 14, weight: .medium)
            contentStack.addArrangedSubview(subtitleLabel)
        }
        
        return cardView
    }
    
// ACTIONS
    @objc private func handleCardTap(_ sender: UITapGestureRecognizer) {
        print("Card tapped!")
    }
}
