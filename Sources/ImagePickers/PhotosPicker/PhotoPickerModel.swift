//
//  PhotoPickerModel.swift
//
//
//  Created by Yauhen Rusanau on 04/02/2024.
//

import PhotosUI
import SwiftUI

@MainActor
final class PhotoPickerModel: ObservableObject {
    @Published
    var imageSelection: PhotosPickerItem? = nil {
        didSet {
            if let imageSelection = imageSelection {
                let progress = loadTransferable(from: imageSelection)
                state = .loading(progress)
            } else {
                state = .empty
            }
        }
    }
    
    @Published
    var state = ItemState.empty
}

private extension PhotoPickerModel {
    func loadTransferable(from imageSelection: PhotosPickerItem) -> Progress {
        imageSelection.loadTransferable(type: Item.self) { result in
            DispatchQueue.main.async {
                guard imageSelection == self.imageSelection else {
                    print("Failed to get the selected item.")
                    return
                }
                switch result {
                case .success(let item?):
                    self.state = .success(item)
                case .success(nil):
                    self.state = .empty
                case .failure(let error):
                    self.state = .failure(error)
                }
            }
        }
    }
}
