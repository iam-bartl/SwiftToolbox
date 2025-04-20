//
//  CameraScreen.swift
//
//
//  Created by Yauhen Rusanau on 05/02/2024.
//

import SwiftUI

#if os(iOS)
public struct CameraPickerView: UIViewControllerRepresentable {
    let didFinish: (UIImage) -> Void
    
    public init(didFinish: @escaping (UIImage) -> Void) {
        self.didFinish = didFinish
    }
    
    public func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    public func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(didFinish: didFinish)
    }
}

public final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let didFinish: (UIImage) -> Void
    init(didFinish: @escaping (UIImage) -> Void) {
        self.didFinish = didFinish
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        didFinish(selectedImage)
    }
}
#endif
