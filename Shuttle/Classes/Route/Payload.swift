//
//  Payload.swift
//  Pods
//
//  Created by Draveness on 5/17/16.
//
//

import Foundation

public struct Payload {
    public var parameters: [String: AnyObject] = [:]
    public var URL: NSURL {
        get {
            return (parameters["URL"] as? String).flatMap(NSURL.init)!
        }
    }
    public var id: Int {
        get {
            if let id = parameters["id"]?.integerValue {
                return id
            }
            return 0
        }
    }

    public subscript(key: String) -> AnyObject? {
        get {
            return parameters[key]
        }
    }
}