//
//  ProfileSignOutButtonView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 03/05/2026.
//

import Foundation
import UIKit

class ProfileSignOutButtonView: UIButton {

    private let verticalInset: CGFloat = 18

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
        var config = UIButton.Configuration.plain()
        config.image = UIImage(
            systemName: "rectangle.portrait.and.arrow.right",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        )
        config.title = "Sign Out"
        config.imagePlacement = .leading
        config.imagePadding = 10
        config.baseForegroundColor = UIColor(hex: Colors.secondary500)
        config.background.backgroundColor = UIColor(hex: Colors.neutral200)
        config.background.cornerRadius = 24
        config.contentInsets = NSDirectionalEdgeInsets(
            top: verticalInset,
            leading: 20,
            bottom: verticalInset,
            trailing: 20
        )
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            return outgoing
        }
        configuration = config
        contentHorizontalAlignment = .center
        contentVerticalAlignment = .center

        addTarget(self, action: #selector(signOutTapped), for: .touchUpInside)
    }

    @objc
    private func signOutTapped() {
        print("sign out tapped")
    }
}
