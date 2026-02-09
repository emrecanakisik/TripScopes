import SwiftUI

struct ViewControllerPreview: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> SignInViewController {
        return SignInViewController()
    }

    func updateUIViewController(_ uiViewController: SignInViewController, context: Context) {
        
    }
}

struct ViewControllerPreview_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview()
            .previewDevice("iPhone 15 Pro")
            .ignoresSafeArea()
    }
}
