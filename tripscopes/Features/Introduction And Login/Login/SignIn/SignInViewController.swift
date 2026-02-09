import UIKit

class SignInViewController: UIViewController {
    let mainView = SignInView()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        SetupActions()
    }
    
    @objc private func NavigateToSignUp() {
        navigationController?.pushViewController(SignUpViewController(), animated: true)
        print("NavigateToSignUp")
    }
    
    @objc private func NavigateToHome() {
        print("NavigateToHome")

    }
    
    private func SetupActions(){
        let actionButtons = mainView.signInButton
        
        actionButtons.continueButton.addTarget(self, action: #selector(NavigateToHome), for: .touchUpInside)
        actionButtons.createAccountButton.addTarget(self, action: #selector(NavigateToSignUp), for: .touchUpInside)
    }

}
