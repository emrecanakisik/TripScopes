import UIKit
import SnapKit

public class SignInViewButtons: UIView{
//ELEMENTS
    lazy var continueButton: UIButton = {
       let button = UIButton()
        return button
    }()
    
    lazy var createAccountButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
//    lazy var createAccountLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = UIColor(hex: Colors.gray)
////        label.text = "You don't have an account? Create one then!"//"Create a new Anonymous session"
//        label.font = UIFont(name: "Roboto-Regular", size: 12)
//        label.textAlignment = .center
//        return label
//    }()
//INIT
    var isAnonymous: Bool
    init(frame: CGRect = .zero, isAnonymous: Bool) {
        self.isAnonymous = isAnonymous
        super.init(frame: frame)
        SetupUI(isAnonymous: isAnonymous)
    }
        
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//SETUP UI
    private func SetupUI(isAnonymous: Bool){
        addSubview(continueButton)
        addSubview(createAccountButton)
        
        var continueButtonConfig = UIButton.Configuration.filled()
        let continueButtonText = isAnonymous ? "Continue with Anonymous ID" : "Continue with Email"
        
        var continueButtonContainer  = AttributeContainer()
        continueButtonContainer.font = UIFont(name: "Roboto-Bold", size: 16)
        
        continueButtonConfig.attributedTitle = AttributedString(continueButtonText, attributes: continueButtonContainer)
        continueButtonConfig.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0)
        continueButtonConfig.baseBackgroundColor = .systemBlue
        continueButtonConfig.baseForegroundColor = .white
        continueButtonConfig.background.cornerRadius = 5
        
        continueButton.configuration = continueButtonConfig
        
        var createAccountButtonConfig = UIButton.Configuration.plain()
        let createAccountLabelText = isAnonymous ? "Create a new Anonymous session" : "You don't have an account? Create one then!"
        
        var createAccountButtonContainer = AttributeContainer()
        createAccountButtonContainer.font = UIFont(name: "Roboto-Regular", size: 12)
        
        createAccountButtonConfig.attributedTitle = AttributedString(createAccountLabelText, attributes: createAccountButtonContainer)
        createAccountButtonConfig.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        createAccountButtonConfig.baseBackgroundColor = .clear
        createAccountButtonConfig.baseForegroundColor = UIColor(hex: Colors.gray)
        createAccountButtonConfig.titleAlignment = .center
        
        createAccountButton.configuration = createAccountButtonConfig

        continueButton.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(0)
            make.leading.trailing.equalToSuperview().inset(0)
//            make.height.equalTo(50)
        }
        
        createAccountButton.snp.makeConstraints{make in
            make.top.equalTo(continueButton.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
//            make.height.equalTo(50)
        }
    }
}
