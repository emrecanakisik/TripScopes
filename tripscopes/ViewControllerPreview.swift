import SwiftUI

struct ViewControllerPreview: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> LoginAnonymousViewController {
        return LoginAnonymousViewController()
    }

    func updateUIViewController(_ uiViewController: LoginAnonymousViewController, context: Context) {
        
    }
}

struct ViewControllerPreview_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview()
            .previewDevice("iPhone 15 Pro")
            .ignoresSafeArea()
    }
}
