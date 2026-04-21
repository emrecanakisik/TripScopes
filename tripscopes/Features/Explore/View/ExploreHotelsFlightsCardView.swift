//
//  ExploreHotelsFlightsCardView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 02/04/2026.
//

import Foundation
import UIKit
import SnapKit

enum ExploreCardType{
    case hotels
    case flights
}

class ExploreHotelsFlightsCardView: UIView {
    
    let viewPadding: CGFloat = 24
    let itemSpace: CGFloat = 16
    
//ELEMENTS
    //TOP
    lazy var typeLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var typeLabelView:UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var typeIcon:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "airplane.departure")
        imageView.tintColor = UIColor(hex: Colors.primary)
        return imageView
    }()
    
    lazy var topStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [typeLabelView, typeIcon])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        return stack
    }()
    
    //MID
    lazy var midIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.trianglehead.swap")
        return imageView
    }()
    
    private func CreateMidLabelStack(topText: String, bottomText: String) -> UIStackView {
        let label1 = UILabel()
        label1.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label1.textColor = UIColor(hex: Colors.tertiary400)
        label1.text = topText.uppercased()
        label1.textAlignment = .center
            
        let label2 = UILabel()
        label2.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label2.textColor = UIColor(hex: Colors.tertiary800)
        label2.text = bottomText.uppercased()
        label2.textAlignment = .center
            
        let stack = UIStackView(arrangedSubviews: [label1, label2])
        stack.axis = .vertical
        stack.alignment = .leading
        return stack
    }
    
//    lazy var midLabelStack1: UIStackView = CreateMidLabelStack(topText: "Departure", bottomText: "New York")
//    lazy var midLabelStack2: UIStackView = CreateMidLabelStack(topText: "To", bottomText: "London")
    
    lazy var midStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        //stack.alignment = .leading
        return stack
    }()
    
    //BOTTOM
    lazy var searchButton: UIButton = {
        
        var config = UIButton.Configuration.plain()
        
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0)
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            return outgoing
        }
        
        let button = UIButton(configuration: config)
        button.setTitleColor(UIColor(hex: Colors.white), for: .normal)
        button.layer.cornerRadius = 48
        return button
    }()
    
//INIT
    var cardType: ExploreCardType?
    var departureCity: String?
    var arrivalCity: String?
    var checkInTime: String?
    var guestCount: String?
    init(frame: CGRect, cardType: ExploreCardType, departureCity: String? = nil, arrivalCity: String? = nil, checkInTime: String? = nil, guestCount: String? = nil){
        self.cardType = cardType
        self.departureCity = departureCity
        self.arrivalCity = arrivalCity
        self.checkInTime = checkInTime
        self.guestCount = guestCount
        super.init(frame: frame)
        SetupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Update Methods
        
    func updateFlight(departureCity: String?, arrivalCity: String?) {
    }
        
    func updateHotel(checkInTime: String?, guestCount: String?) {
    }
    
//UI SETUP
    private func SetupUI(){
        backgroundColor = UIColor(hex: Colors.white)
        layer.cornerRadius = 32
        
        typeLabelView.addSubview(typeLabel)
        addSubview(topStack)
        addSubview(midStack)
        addSubview(searchButton)
        
        switch cardType {
        case .hotels:
            //TOP
            typeLabel.text = "Hotels"
            typeLabel.textColor = UIColor(hex: Colors.secondary700)
            typeLabelView.backgroundColor = UIColor(hex: Colors.secondary200)
            
            typeIcon.image = UIImage(systemName: "bed.double")
            typeIcon.tintColor = UIColor(hex: Colors.secondary700)
            
            //MID
            lazy var midLabelStack1: UIStackView = CreateMidLabelStack(topText: "check-in", bottomText: checkInTime!)
            lazy var midLabelStack2: UIStackView = CreateMidLabelStack(topText: "guests", bottomText: guestCount!)
            midStack.addArrangedSubview(midLabelStack1)
            midStack.addArrangedSubview(midLabelStack2)
            
            

            //BOTTOM
            searchButton.backgroundColor = UIColor(hex: Colors.secondary700)
            searchButton.setTitle("Find Stays", for: .normal)
            
            
        case .flights:
            //TOP
            typeLabel.text = "Flights"
            typeLabel.textColor = UIColor(hex: Colors.primary700)
            typeLabelView.backgroundColor = UIColor(hex: Colors.primary200)
            
            typeIcon.image = UIImage(systemName: "airplane.departure")
            typeIcon.tintColor = UIColor(hex: Colors.primary700)
            
            //MID
            lazy var midLabelStack1: UIStackView = CreateMidLabelStack(topText: "From", bottomText: departureCity!)
            lazy var midLabelStack2: UIStackView = CreateMidLabelStack(topText: "To", bottomText: arrivalCity!)
            midStack.addArrangedSubview(midLabelStack1)
            midStack.addArrangedSubview(midLabelStack2)
            
            
            //BOTTOM
            searchButton.backgroundColor = UIColor(hex: Colors.primary700)
            searchButton.setTitle("Search Flights", for: .normal)
            
        case nil:
            print("There is no card type.")
        }
        
        typeLabel.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview().inset(4)
            make.leading.trailing.equalToSuperview().inset(12)
        }
        
        typeIcon.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
        
        topStack.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(viewPadding)
        }
            
        midStack.snp.makeConstraints { make in
            make.top.equalTo(topStack.snp.bottom).offset(itemSpace)
            make.leading.trailing.equalToSuperview().inset(viewPadding)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(midStack.snp.bottom).offset(viewPadding)
            make.bottom.equalToSuperview().inset(viewPadding)
            make.leading.trailing.equalToSuperview().inset(viewPadding)
        }
        
        
    
    }
}
