//
//  Builder.swift
//  Shuttle
//
//  Created by 左书祺 on 8/19/16.
//  Copyright © 2016 draveness. All rights reserved.
//

import Foundation

extension Guidelines where Self: UIViewController {
    public init(resource: Any) {
        self.init(nibName: nil, bundle: nil)
    }
}

public extension UIViewController {
    public convenience init(resource: Any) {
        self.init(nibName: nil, bundle: nil)
    }
}

public class Builder {
    init<A>(resource: Resource<A>, destination: UIViewController.Type) {
        TransferController(load: { callback in
//            Webservice.load(resource, completion: callback)
        }, build: { resource in
            UIViewController.init(resource: resource)
        })
    }
}