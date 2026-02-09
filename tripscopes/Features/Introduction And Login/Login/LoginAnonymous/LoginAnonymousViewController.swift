import UIKit

class LoginAnonymousViewController: UIViewController {
    
    private let mainView = LoginAnonymousView()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        SetupActions()
    }
    
    @objc private func CreateAnonymousSession(){
//        mainView.enterUIDView.enterUID.text = "000"
        
    }
    @objc private func AnonymousLogin(){
//        var textFieldValue = mainView.enterUIDView.enterUID.text
    }

    private func SetupActions(){
//        let buttonGroup = Dictionary(grouping: mainView.anonymousLoginButtonStackView.buttons){ $0.isCreated }
//        
//        buttonGroup[true]?.forEach{ $0.addTarget(self, action: #selector(AnonymousLogin), for: .touchUpInside) }
//        buttonGroup[false]?.forEach{ $0.addTarget(self, action: #selector(CreateAnonymousSession), for: .touchUpInside) }
        
        let actionButtons = mainView.anonymousLoginButtonsView
        
        actionButtons.continueButton.addTarget(self, action: #selector(AnonymousLogin), for: .touchUpInside)
        actionButtons.createAccountButton.addTarget(self, action: #selector(CreateAnonymousSession), for: .touchUpInside)
        
    }
    
}
