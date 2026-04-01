//
//  PageTitleView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 01/04/2026.
//

import Foundation
import UIKit
import SnapKit

class PageTitleView: UIView {

//ELEMENTS
    lazy var labelView: UIView = {
       let view = UIView()
        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor.red.cgColor
        return view
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
//INIT
    var title: String
    init(frame: CGRect, title: String){
        self.title = title
        super.init(frame: frame)
        SetupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//UI SETUP
    private func SetupUI() {
        addSubview(labelView)
        labelView.addSubview(label)
        label.text = title
        
        labelView.snp.makeConstraints {make in
            make.edges.equalToSuperview()
        }
        
        label.snp.makeConstraints {make in
            //make.edges.equalToSuperview()
            make.leading.top.bottom.equalToSuperview().inset(20)
        }
    }
    
}
