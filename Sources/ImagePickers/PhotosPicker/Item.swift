//
//  Item.swift
//
//
//  Created by Yauhen Rusanau on 04/02/2024.
//

#if canImport(AppKit)
import AppKit
#elseif canImport(UIKit)
import UIKit
#endif
import CoreTransferable

import ImageType

struct Item: Transferable {
    let image: ImageType
    
    enum TransferError: Error {
        case importFailed
    }
    
    static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(importedContentType: .image) { data in
            guard let image = ImageType(data: data) else {
                throw TransferError.importFailed
            }
            return Item(image: image)
        }
    }
}
