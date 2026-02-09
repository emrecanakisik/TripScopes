import UIKit
import SnapKit

class SignInTextFieldStackView: UIStackView{
//ELEMENTS
    lazy var textFields: [PaddedTextField] = [
        PaddedTextField(isPassword: false, placeholderText: "Email"),
        PaddedTextField(isPassword: true, placeholderText: "Password"),
    ]
    
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
        axis = .vertical
        spacing = 7
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 25, right: 10)
        layer.cornerRadius = 20
        backgroundColor = UIColor(hex: Colors.darkGray)

        textFields.forEach{addArrangedSubview($0)}
        
//        textFields.snp.makeConstraints {make in
//            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
//        }
    }
}
