import Foundation
import SwiftUI

#if canImport(UIKit)
public extension Image {
    static func from(nativeImage: UIImage) -> Image {
        Image(uiImage: nativeImage)
    }
}
#elseif canImport(AppKit)
public extension Image {
    static func from(nativeImage: NSImage) -> Image {
        Image(nsImage: nativeImage)
    }
}
#endif
