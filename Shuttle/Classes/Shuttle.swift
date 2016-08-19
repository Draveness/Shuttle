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
    
    public static func route(route: String, block: (Payload -> UIViewController)) {
        routes[route] = block
    }

    public static func route(route: String, viewController: UIViewController.Type) {
        self.route(route) { _ in
            viewController.init()
        }
    }

    public static func launch(path: String) -> () {
        for (route, block) in self.routes.routes {
            let regex = Regex(route)
            if regex.isMatch(path) {
                var payload = Payload()
                payload.parameters = regex.matchResult(path)
                payload.parameters["URL"] = path
                let viewController = block(payload)
                let navigation = UIViewController.topMostNavigationController()
                navigation?.pushViewController(viewController, animated: true)
            }
        }
        return
    }
}