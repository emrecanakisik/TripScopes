import UIKit

class AnonymousLoginButtonStackView: UIStackView{
//ELEMENTS
    lazy var buttons: [AnonymousLoginButton] = [
        AnonymousLoginButton(isCreated: true),
        AnonymousLoginButton(isCreated: false),
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
