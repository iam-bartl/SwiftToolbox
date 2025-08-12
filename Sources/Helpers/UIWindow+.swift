#if os(iOS)
import SwiftUI
import UIKit

public extension UIWindow {
    func show<Content: View>(content: () -> Content) {
        let controller = UIHostingController(rootView: content())
        controller.modalPresentationStyle = .fullScreen
        rootViewController?.present(controller, animated: true)
    }
}

public extension UIWindowScene {
    static var currentScene: UIWindowScene? {
        UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.first
    }
    
    func newWindow() -> UIWindow {
        let window = UIWindow(windowScene: self)
        let rootController = UIViewController()
        rootController.view.backgroundColor = .clear
        window.rootViewController = rootController
        window.isHidden = false
        return window
    }
}
#endif
