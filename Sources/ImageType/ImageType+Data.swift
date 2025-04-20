//
//  ImageType+Data.swift
//  
//
//  Created by Yauhen Rusanau on 02/02/2024.
//

#if os(macOS)
import AppKit
#else
import UIKit
#endif

public extension ImageType {
    var jpg: Data? {
        #if os(macOS)
        guard let cgImage = cgImage(forProposedRect: nil, context: nil, hints: nil) else { return nil }
        let bitmapRep = NSBitmapImageRep(cgImage: cgImage)
        let jpegData = bitmapRep.representation(using: NSBitmapImageRep.FileType.jpeg, properties: [:])
        return jpegData
        #else
        jpegData(compressionQuality: 0.8)
        #endif
    }
}
