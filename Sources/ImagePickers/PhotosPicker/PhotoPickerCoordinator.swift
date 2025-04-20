//
//  PhotoPickerCoordinator.swift
//
//
//  Created by Yauhen Rusanau on 04/02/2024.
//

import PhotosUI
import SwiftUI

import ImageType

public struct PhotoPickerView: View {
    public init(selectActionTitle: String, cancelActionTitle: String, imageBlock: @escaping (ImageType) -> Void) {
        self.selectActionTitle = selectActionTitle
        self.cancelActionTitle = cancelActionTitle
        self.imageBlock = imageBlock
    }
    
    private let selectActionTitle: String
    private let cancelActionTitle: String
    private let imageBlock: (ImageType) -> Void
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var model = PhotoPickerModel()
    
    public var body: some View {
        PhotosPicker(
            selection: $model.imageSelection,
            matching: .images,
            photoLibrary: .shared()
        ) {
            Text("Select Photo")
        }
        .photosPickerStyle(.inline)
        .photosPickerDisabledCapabilities(.selectionActions)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button(cancelActionTitle) {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .primaryAction) {
                Button(selectActionTitle) {
                    guard case .success(let image) = model.state else {
                        return
                    }
                    imageBlock(image.image)
                }
                .fontWeight(.semibold)
                .disabled(!model.state.hasContent)
            }
        }
    }
}
