import UIKit
import SnapKit

class IntroductionView: UIView {
//ELEMENTS
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "intro-img-london.jpg"))
        image.contentMode = .scaleAspectFill
        image.layer.zPosition = -1
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var topTitleLabel: UILabel = {
        let label = UILabel()
        let text = "Let the journey begin with TripsScops!"
        
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
        let text = "Discover the World's Most Magnificent Cities."
        
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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        let text = "Explore the wonders of history, art, and culture."
        
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
    
    lazy var continueButton: UIButton = {
        var config  = UIButton.Configuration.filled()
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .black
        config.cornerStyle = .capsule
        config.image = UIImage(systemName: "arrow.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40, weight: .bold))
//        config.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//UI SETUP
    private func SetupUI(){
        addSubview(backgroundImage)
        addSubview(topTitleLabel)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(continueButton)
        
        backgroundImage.snp.makeConstraints{make in make.edges.equalToSuperview()}
        topTitleLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(80)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        titleLabel.snp.makeConstraints{make in
            make.bottom.equalToSuperview().inset(240)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        subtitleLabel.snp.makeConstraints{make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        continueButton.snp.makeConstraints{make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
    }
    
}
