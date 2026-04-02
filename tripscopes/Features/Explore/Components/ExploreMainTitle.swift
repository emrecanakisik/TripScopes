//
//  ExploreMainTitle.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 01/04/2026.
//

import Foundation
import UIKit
import SnapKit

class ExploreMainTitle: UILabel {
//ELEMENTS
    lazy var label:UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        
        return label
    }()
    
//INIT
    var labelText: String
    init(frame: CGRect, labelText: String){
        self.labelText = labelText
        super.init(frame: frame)
        SetupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//UI SETUP
    private func SetupUI(){
        addSubview(label)
        label.text = labelText
        
        label.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
    }
    
}
