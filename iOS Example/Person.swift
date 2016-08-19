//
//  Person.swift
//  Shuttle
//
//  Created by Draveness on 8/19/16.
//  Copyright © 2016 draveness. All rights reserved.
//

import Foundation
import Shuttle

struct Person {
    let id: Int
    let name: String
}

extension Person {
    init?(dictionary: JSONDictionary) {
        guard let id = dictionary["id"] as? Int,
            name = dictionary["name"] as? String else { return nil }
        self.id = id
        self.name = name
    }
    
    static func retrieve(id: Int) -> Resource<Person> {
        return Resource<Person>(url: NSURL(string: "http://localhost:3000/people/\(id)")!, parseJSON: { json in
            
            guard let dictionary = json as? JSONDictionary else { return nil }
            return Person(dictionary: dictionary)
        })
    }
    
    static func reteieveAll() -> Resource<[Person]> {
        return Resource<[Person]>(url: NSURL(string: "http://localhost:3000/people")!, parseJSON: { json in
            
            guard let dictionaries = json as? [JSONDictionary] else { return nil }
            return dictionaries.flatMap(Person.init)
        })
    }
}
