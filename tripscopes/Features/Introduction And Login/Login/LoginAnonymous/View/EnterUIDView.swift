import UIKit
import SnapKit

class EnterUIDView: UIView{
//ELEMENTS
    lazy var UIDLabel: UILabel = {
        let label = UILabel()
        label.text = "Anonymous ID"
        label.textColor = .systemGray
        label.font = UIFont(name: "Roboto-Regular", size: 15)
        return label
    }()
    
    lazy var enterUID: UITextField = {
        let textField = UITextField()
        textField.textColor = .systemGray
        textField.font = UIFont(name: "Roboto-Regular", size: 17)
        textField.textAlignment = .center
        return textField
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
        backgroundColor = UIColor(hex: "#1A1A1E")
        layer.cornerRadius = 5
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(UIDLabel)
        addSubview(enterUID)
        
        UIDLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(15)
            make.centerX.equalToSuperview()
        }
        enterUID.snp.makeConstraints{make in
            make.top.equalTo(UIDLabel.snp.bottom).offset(5)
            make.bottom.equalToSuperview().inset(15)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
