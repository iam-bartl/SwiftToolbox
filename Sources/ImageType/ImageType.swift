//
//  ImageType.swift
//  
//
//  Created by Yauhen Rusanau on 02/02/2024.
//

#if os(macOS)
import AppKit
public typealias ImageType = NSImage
#else
import UIKit
public typealias ImageType = UIImage
#endif
