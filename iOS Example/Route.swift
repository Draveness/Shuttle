//
//  Route.swift
//  Shuttle
//
//  Created by 左书祺 on 8/19/16.
//  Copyright © 2016 draveness. All rights reserved.
//

import Foundation
import Shuttle

final class Route {
    static func setup() {
        Shuttle.route("http://localhost:3000/people/:id") { payload in
            return TransferController(load: { callback in
                Webservice.load(Person.retrieve(payload.id), completion: callback)
            }, build: SuccViewController.init)
        }
        Shuttle.route("http://localhost:3000/people") { payload in
            return TransferController(load: { callback in
                Webservice.load(Person.retrieveAll(), completion: callback)
            }, build: ViewController.init)
        }
    }
}