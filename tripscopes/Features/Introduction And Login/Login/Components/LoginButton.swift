import UIKit
import SnapKit

class LoginButton: UIButton {
    
    lazy var buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 5
        stack.isUserInteractionEnabled = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var buttonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var buttonLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//INIT
    var isAnonymous: Bool
    init(frame: CGRect = .zero, isAnonymous: Bool) {
        self.isAnonymous = isAnonymous
        super.init(frame: frame)
        SetupUI(isAnonymous: isAnonymous)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//UI SETUP
    private func SetupUI(isAnonymous: Bool) {
        buttonImage.tintColor = isAnonymous ? .white : .black
        if isAnonymous{
            buttonImage.image = UIImage(named: "ghost-solid-full")
            buttonLabel.text = "Continue as Anonymous"
            buttonLabel.textColor = .white
            backgroundColor = .black
        }else{
            buttonImage.image = UIImage(systemName: "person.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .bold))
            buttonLabel.text = "Continue to Login"
            buttonLabel.textColor = .black
            backgroundColor = .white
        }
        
        clipsToBounds = true
        layer.cornerRadius = 22
//        addSubview(buttonBlurView)
        buttonStack.addArrangedSubview(buttonImage)
        buttonStack.addArrangedSubview(buttonLabel)
        addSubview(buttonStack)
        
        buttonStack.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(7)
        }
        

        buttonImage.snp.makeConstraints{make in
//            make.leading.equalToSuperview().inset(5)
            make.width.equalTo(33)
            make.height.equalTo(33)
        }
        
        
        
    }
}

