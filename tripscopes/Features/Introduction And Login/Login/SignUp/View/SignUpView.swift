import UIKit
import SnapKit

class SignUpView: UIView {
//ELEMENTS
    let signInTextFieldStackView = SignInTextFieldStackView()
    let signInButton = SignInViewButtons(isAnonymous: false)
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "key.shield.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40, weight: .bold, scale: .large))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
//    func animateToSuccess() {
//        let config = UIImage.SymbolConfiguration(pointSize: 40, weight: .bold, scale: .large)
//
//        guard let newImage = UIImage(systemName: "checkmark.shield.fill", withConfiguration: config) else { return }
//
//        if #available(iOS 17.0, *) {
//            imageView.setSymbolImage(newImage, contentTransition: .replace.downUp.byLayer)
//        } else {
//            imageView.image = newImage
//        }
//    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.font = UIFont(name: "Roboto-Bold", size: 27)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose a secure way to continue."
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
        backgroundColor = UIColor(hex: "#0F0F12")
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(signInTextFieldStackView)
        addSubview(signInButton)
        
        
        
        imageView.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
        }
        titleLabel.snp.makeConstraints{make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
        }
        subtitleLabel.snp.makeConstraints {make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
        }
        signInTextFieldStackView.snp.makeConstraints{make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        signInButton.snp.makeConstraints{make in
            make.top.equalTo(signInTextFieldStackView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(100)
        }
//        enterUIDView.snp.makeConstraints{make in
//            make.top.equalTo(subtitleLabel.snp.bottom).offset(10)
//            make.leading.trailing.equalToSuperview().inset(30)
//        }
//        anonymousLoginButtonStackView.snp.makeConstraints{make in
//            make.top.equalTo(enterUIDView.snp.bottom).offset(10)
//            make.leading.trailing.equalToSuperview().inset(30)
//        }
    }
}
