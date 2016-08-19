//
//  Shuttle.swift
//  Pods
//
//  Created by Draveness on 5/16/16.
//
//

import UIKit

public class Shuttle {
    public static var destination = "127.0.0.1"
    
    static var routes: RouteMap = RouteMap()
    
    public static func route(route: String, block: ((Payload, UINavigationController?) -> ())) {
        routes[route] = block
    }

    public static func route(route: String, viewController: UIViewController.Type) {
        self.route(route) { parameter, navigation in
            let viewController = viewController.init()
            navigation?.pushViewController(viewController, animated: true)
        }
    }

    public static func launch(path: String) -> () {
        for (route, block) in self.routes.routes {
            let regex = Regex(route)
            if regex.isMatch(path) {
                var payload = Payload()
                payload.parameters = regex.matchResult(path)
                payload.parameters["URL"] = path
                return block(payload, UIViewController.topMostNavigationController())
            }
        }
        return
    }
}