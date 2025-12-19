import SwiftUI

struct ViewControllerPreview: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> IntroductionViewController {
        return IntroductionViewController()
    }

    func updateUIViewController(_ uiViewController: IntroductionViewController, context: Context) {
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
