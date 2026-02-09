import UIKit
import SnapKit

class PaddedTextField: UIView{
//ELEMENTS
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var forgetPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forget password?", for: .normal)
        button.setTitleColor(UIColor(hex: Colors.gray), for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//INIT
    var isPassword: Bool
    var placeholderText: String
    init(frame: CGRect = .zero, isPassword: Bool = false, placeholderText: String) {
        self.isPassword = isPassword
        self.placeholderText = placeholderText
        super.init(frame: frame)
        SetupUI(isPassword: isPassword, placeholderText: placeholderText)
    }
        
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//SETUPUI
    private func SetupUI(isPassword: Bool, placeholderText: String){
        layer.borderWidth = 1
        layer.cornerRadius = 10
        layer.borderColor = UIColor(hex: Colors.gray).cgColor
        
        addSubview(textField)
        textField.textColor = .white
        textField.placeholder = placeholderText
        
        if (isPassword){
            addSubview(forgetPasswordButton)
            
            forgetPasswordButton.snp.makeConstraints{make in
                make.top.equalTo(textField.snp.bottom).offset(7)
                make.leading.equalToSuperview().inset(7)
            }
        }
        
        textField.snp.makeConstraints{make in
            make.edges.equalToSuperview().inset(10)
        }
        
        
    }
}
