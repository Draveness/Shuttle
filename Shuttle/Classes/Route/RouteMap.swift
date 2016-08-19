//
//  RouteMap.swift
//  Pods
//
//  Created by Draveness on 5/16/16.
//
//

import Foundation

struct RouteMap {
    var routes: [String: (Payload -> UIViewController)] = [:]
    subscript(route: String) -> (Payload -> UIViewController)? {
        get {
            return routes[route]
        }
        set {
            routes[route] = newValue
        }
    }
}
