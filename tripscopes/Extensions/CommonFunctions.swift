//
//  CommonFunctions.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 01/04/2026.
//
import UIKit
import SnapKit

extension UIViewController {

//FEATURE PAGES
    func CommonTitleView(title: String) {
        let pageTitle = PageTitleView(frame: .zero, title: title)
        view.addSubview(pageTitle)
        
        pageTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    
}
