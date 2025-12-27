import UIKit
import SnapKit

class LoginView: UIView {
//ELEMENTS
    let loginButtonStackView = LoginButtonStackView()
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "login-img-london"))
        image.contentMode =  .scaleAspectFill
        image.layer.zPosition = -1
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var topTitleLabel: UILabel = {
        let label = UILabel()
        let text = "Your adventure awaits!"
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0
        paragraphStyle.alignment = .center
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        
        label.attributedText = attributedString
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.font = UIFont(name: "GreatVibes-Regular", size: 45)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        let text = "Undercover hidden gems."
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0
        paragraphStyle.alignment = .center
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        
        label.attributedText = attributedString
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.font = UIFont(name: "Roboto-Regular", size: 33)
        label.font = UIFont.boldSystemFont(ofSize: 33)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        let text = "Plan your perfect escape today."
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0
        paragraphStyle.alignment = .center
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        
        label.attributedText = attributedString
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.font = UIFont(name: "Roboto-Regular", size: 18)
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
        addSubview(backgroundImage)
        addSubview(topTitleLabel)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(loginButtonStackView)
        
        backgroundImage.snp.makeConstraints{make in make.edges.equalToSuperview()}
        topTitleLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(80)
            make.leading.trailing.equalToSuperview().inset(40)
        }
        titleLabel.snp.makeConstraints{make in
//            make.bottom.equalToSuperview().inset(240)
            make.bottom.equalTo(subtitleLabel.snp.top).offset(-10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        subtitleLabel.snp.makeConstraints{make in
//            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.bottom.equalTo(loginButtonStackView.snp.top).offset(-20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        loginButtonStackView.snp.makeConstraints{make in
//            make.top.equalTo(subtitleLabel.snp.bottom).offset(20)
            make.bottom.equalToSuperview().inset(40)
            make.leading.trailing.equalToSuperview().inset(40)
        }
    }
}
