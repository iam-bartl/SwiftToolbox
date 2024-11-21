//
//  SupportBuilder.swift
//
//
//  Created by Yauhen Rusanau on 07/02/2024.
//

import Foundation
import Device

public struct SupportBuilder {
    let appId: String
    let supportEmail: String
    let supportSubject: String
    
    public init(appId: String, supportEmail: String, supportSubject: String) {
        self.appId = appId
        self.supportEmail = supportEmail
        self.supportSubject = supportSubject
    }
}

public extension SupportBuilder {
    var appVersion: String {
        Device.fullAppVersion
    }
    
    var url: URL {
        guard let url = URL(string: "itms-apps://itunes.apple.com/app/id\(appId)") else { preconditionFailure() }
        return url
    }
    
    var rateUrl: URL {
        let result = url.appending(queryItems: [.init(name: "action", value: "write-review")])
        return result
    }
    
    @MainActor
    var supportUrl: URL {
        let appVesrion = Device.appVersion ?? ""
        let buildVesrion = Device.buildVersion ?? ""
        let model = Device.identifier
        let osVesrion = Device.osVersion ?? ""
        let body = "<br><br>App Version: \(appVesrion)<br>Build version: \(buildVesrion)<br>Model: \(model)<br>OS version: \(osVesrion)"
        guard
            let subjectEncoded = supportSubject.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
            let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
            let result = URL(string: "mailto:\(supportEmail)?subject=\(subjectEncoded)&body=\(bodyEncoded)")
        else { preconditionFailure() }
        return result
    }
}
