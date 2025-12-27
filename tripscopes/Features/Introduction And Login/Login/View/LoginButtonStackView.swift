import UIKit

class LoginButtonStackView: UIStackView {
//ELEMENTS
//    let loginButton = LoginButton(isAnonymous: false)
//    let anonymousLoginButton = LoginButton(isAnonymous: true)
    
    lazy var buttons: [LoginButton] = [
        LoginButton(isAnonymous: false),
        LoginButton(isAnonymous: true)
    ]
    
//INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetupUI()
    }
            
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
            
//SETUP UI
    private func SetupUI(){
        axis = .vertical
        spacing = 5
        
        buttons.forEach(addArrangedSubview)
    }
}
