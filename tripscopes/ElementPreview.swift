import SwiftUI
import UIKit

struct MyCardViewPreview: UIViewRepresentable {

    func makeUIView(context: Context) -> UIView {
        let container = UIView()
        container.backgroundColor = .clear

        let content = SignInViewButtons(isAnonymous: true)
        content.translatesAutoresizingMaskIntoConstraints = false
//        content.layer.borderColor = UIColor.blue.cgColor
//        content.layer.borderWidth = 1

        container.addSubview(content)

        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: container.topAnchor),
            content.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            content.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: container.trailingAnchor)

        ])

        let dashedBorder = CAShapeLayer()
        dashedBorder.name = "debugBorder"
        dashedBorder.strokeColor = UIColor.red.cgColor
        dashedBorder.fillColor = nil
        dashedBorder.lineDashPattern = [6, 4]
        dashedBorder.lineWidth = 1

        container.layer.addSublayer(dashedBorder)

        return container
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.async {
            guard let dashedBorder = uiView.layer.sublayers?
                .first(where: { $0.name == "debugBorder" }) as? CAShapeLayer else { return }

            dashedBorder.frame = uiView.bounds
            dashedBorder.path = UIBezierPath(rect: uiView.bounds).cgPath
        }
    }
}

#Preview {
    MyCardViewPreview()
        .frame(width: 300, height: 300)
}
