//
//  ExploreCategoriesRowCell.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 25/04/2026.
//

import Foundation
import UIKit
import SnapKit

class ExploreCategoriesRowCell: UICollectionViewCell {
    
    static let reuseID = "CategoriesRowCell"
    private let categories: [String] = ["Beach", "Mountains", "History", "Food", "Art", "Photography"]
    
    var onCategoryTapped: ((String) -> Void)?
    
//ELEMENTS
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        return scrollView
    }()

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        return stackView
    }()
    
    private func createCategoryCard() -> UIView {
        let view = UIView()
        // view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.0)
        view.backgroundColor = UIColor(hex: Colors.neutral200)
        view.layer.cornerRadius = 20
        return view
    }
    
    private func createIconImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor(red: 0.0, green: 0.35, blue: 0.75, alpha: 1.0)
        return imageView
    }
    
    private func createCategoryTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }
    
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
        contentView.backgroundColor = .clear
        
        contentView.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        categories.forEach { category in
            let card = createCategoryCard()
            let icon = createIconImageView()
            let title = createCategoryTitleLabel()
            
            title.text = category.uppercased()
            icon.image = getIcon(for: category)
            
            card.addSubview(icon)
            
            card.snp.makeConstraints { make in
                make.width.height.equalTo(72)
            }
            
            icon.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.width.height.equalTo(28)
            }
            
            let itemStack = UIStackView(arrangedSubviews: [card, title])
            itemStack.axis = .vertical
            itemStack.spacing = 10
            itemStack.alignment = .center
            
            let containerView = UIView()
            containerView.addSubview(itemStack)
            itemStack.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            let tapButton = UIButton(type: .custom)
            tapButton.addAction(UIAction(handler: { [weak self] _ in
                print("Clicked to \(category)!")
                self?.onCategoryTapped?(category)
            }), for: .touchUpInside)
            
            containerView.addSubview(tapButton)
            tapButton.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            mainStackView.addArrangedSubview(containerView)
        }
    }
    
    private func getIcon(for category: String) -> UIImage? {
        switch category {
        case "Beach": return UIImage(systemName: "umbrella")
        case "Mountains": return UIImage(systemName: "mountain.2")
        case "History": return UIImage(systemName: "compass.drawing") // Drafting compass / Divider
        case "Food": return UIImage(systemName: "fork.knife")
        case "Art": return UIImage(systemName: "paintpalette")
        case "Photography": return UIImage(systemName: "camera")
        default: return UIImage(systemName: "sparkles")
        }
    }
}
