//
//  UIDevice+Extensions.swift
//
//
//  Created by Yauhen Rusanau on 21/10/2023.
//

import Foundation
#if os(iOS) || os(tvOS)
import UIKit
#endif

public enum Device {
    public static var appVersion: String? {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    public static var buildVersion: String? {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }
    
    public static var identifier: String {
      var systemInfo = utsname()
      uname(&systemInfo)
      let mirror = Mirror(reflecting: systemInfo.machine)

      let identifier = mirror.children.reduce("") { identifier, element in
        guard let value = element.value as? Int8, value != 0 else { return identifier }
        return identifier + String(UnicodeScalar(UInt8(value)))
      }
      return identifier
    }
    
    public static var osVersion: String? {
        var osVersion: String?
        #if os(iOS) || os(tvOS)
            osVersion = UIDevice.current.systemVersion
        #else
            let version = ProcessInfo.processInfo.operatingSystemVersion
            osVersion = "\(version.majorVersion).\(version.minorVersion).\(version.patchVersion)"
        #endif
        return osVersion
    }
}
