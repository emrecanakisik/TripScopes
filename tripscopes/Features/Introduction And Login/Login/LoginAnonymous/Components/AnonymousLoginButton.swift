import UIKit

class AnonymousLoginButton: UIButton{
//INIT
    var isCreated: Bool
    init(frame: CGRect = .zero, isCreated: Bool) {
        self.isCreated = isCreated
        super.init(frame: frame)
        SetupUI(isCreated: isCreated)
    }
        
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//SETUP UI
    private func SetupUI(isCreated: Bool){
        var config = UIButton.Configuration.filled()
        
        let text = isCreated ? "Continue with Anonymous ID" : "Create a new Anonymous session"
        
        var container  = AttributeContainer()
        container.font = UIFont(name: "Roboto-Bold", size: 16)
        
        config.attributedTitle = AttributedString(text, attributes: container)
        config.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0)
        
        if isCreated{
            config.baseBackgroundColor = .systemBlue
            config.baseForegroundColor = .white
            config.background.cornerRadius = 5
        }else{
            config.baseBackgroundColor = .clear
            config.baseForegroundColor = .systemGray
        }
        
        self.configuration = config
    }
}
