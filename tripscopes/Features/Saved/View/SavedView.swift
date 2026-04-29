//
//  SavedView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 29/04/2026.
//

import Foundation
import UIKit
import SnapKit

class SavedView: UIView {
    //Constants
    private let viewPadding: CGFloat = 24

    //ViewModel
    private let viewModel: SavedViewModel

//ELEMENTS
    
//INIT
    init(viewModel: SavedViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        SetupUI()
    }

    override init(frame: CGRect) {
        self.viewModel = SavedViewModel()
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
