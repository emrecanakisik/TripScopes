//
//  ProfileView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 02/05/2026.
//

import Foundation
import UIKit
import SnapKit

class ProfileView: UIView {
    
    //Constants
    private let viewPadding: CGFloat = 24

    //ViewModel
    private let viewModel: ProfileViewModel
    
    
//INIT
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        SetupUI()
    }
    
    override init(frame: CGRect) {
        self.viewModel = ProfileViewModel()
        super.init(frame: frame)
        SetupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//UI SETUP
    private func SetupUI() {
        
    }
}
