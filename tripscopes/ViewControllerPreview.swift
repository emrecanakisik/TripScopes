import SwiftUI

struct ViewControllerPreview: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> LoginViewController {
        return LoginViewController()
    }

    func updateUIViewController(_ uiViewController: LoginViewController, context: Context) {
        // Preview update burada olur. Genelde boş bırakırız.
    }
}

struct ViewControllerPreview_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview()
            .previewDevice("iPhone 15 Pro")
            .ignoresSafeArea()
    }
}
