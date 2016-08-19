//
//  Webservice.swift
//  Shuttle
//
//  Created by 左书祺 on 8/19/16.
//  Copyright © 2016 draveness. All rights reserved.
//

import Foundation

final public class Webservice {
    static public func load<A>(resource: Resource<A>, completion: (A?) -> ()) {
        NSURLSession.sharedSession().dataTaskWithURL(resource.url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            completion(resource.parse(data))
        }.resume()
    }
}