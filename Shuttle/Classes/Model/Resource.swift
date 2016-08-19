//
//  Resource.swift
//  Shuttle
//
//  Created by Draveness on 8/19/16.
//  Copyright © 2016 draveness. All rights reserved.
//

import Foundation

public typealias JSONDictionary = [String: AnyObject]

public struct Resource<A> {
    let url: NSURL
    let parse: NSData -> A?
}

public extension Resource {
    init(url: NSURL, parseJSON: AnyObject -> A?) {
        self.url = url
        self.parse = { data in
            let json = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
            return json.flatMap(parseJSON)
        }
    }
}