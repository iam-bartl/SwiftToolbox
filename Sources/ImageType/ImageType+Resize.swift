//
//  Image+Resize.swift
//
//
//  Created by Yauhen Rusanau on 29/01/2024.
//

#if os(macOS)
import AppKit
#else
import UIKit
#endif

public extension ImageType {
    #if os(macOS)
    func resize(_ targetSize: CGSize) -> ImageType? {
        let frame = NSRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height)
        guard let representation = bestRepresentation(for: frame, context: nil, hints: nil) else {
            return nil
        }
        let image = NSImage(size: targetSize, flipped: false, drawingHandler: { (_) -> Bool in
            representation.draw(in: frame)
        })
        
        return image
    }
    #else
    func resize(_ targetSize: CGSize) -> ImageType? {
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: floor(size.width * heightRatio), height: floor(size.height * heightRatio))
        } else {
            newSize = CGSize(width: floor(size.width * widthRatio), height: floor(size.height * widthRatio))
        }

        
        let newImage = UIGraphicsImageRenderer(size: newSize).image { ctx in
            draw(in: .init(origin: .zero, size: newSize))
        }

        return newImage
    }
    #endif
    
    func resize(maxSide side: CGFloat) -> ImageType? {
        let newSize: CGSize
        let aspect = size.width / size.height
        if aspect > 1.0 {
            newSize = .init(width: side, height: floor(side / aspect))
        } else {
            newSize = .init(width: floor(side * aspect), height: side)
        }
        return resize(newSize)
    }
}
