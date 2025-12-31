import UIKit

class LoginViewController: UIViewController {
    
    private let mainView = LoginView()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        SetupActions()
        self.navigationItem.hidesBackButton = true
    }
    
    @objc private func AnonymousNavigationButton(){
        let vc = LoginAnonymousViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func LoginNavigationButton(){
        let vc = SignInViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func SetupActions(){
        let buttonGroup = Dictionary(grouping: mainView.loginButtonStackView.buttons){ $0.isAnonymous }
        
        buttonGroup[true]?.forEach{ $0.addTarget(self, action: #selector(AnonymousNavigationButton), for: .touchUpInside) }
        buttonGroup[false]?.forEach{ $0.addTarget(self, action: #selector(LoginNavigationButton), for: .touchUpInside) }
        
    }
}
