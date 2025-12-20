import UIKit

class IntroductionViewController: UIViewController {

    private let mainView = IntroductionView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupActions()
    }
    
    @objc private func NavigationButton(){
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func SetupActions() {
        mainView.continueButton.addTarget(self, action: #selector(NavigationButton), for: .touchUpInside)

    }

}
