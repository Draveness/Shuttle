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
    public subscript(key: String) -> AnyObject? {
        get {
            return parameters[key]
        }
    }
}