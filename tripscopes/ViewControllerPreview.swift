import SwiftUI

struct ViewControllerPreview: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> SignUpViewController {
        return SignUpViewController()
    }

    func updateUIViewController(_ uiViewController: SignUpViewController, context: Context) {
        
    }
}

struct ViewControllerPreview_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview()
            .previewDevice("iPhone 15 Pro")
            .ignoresSafeArea()
    }
}
