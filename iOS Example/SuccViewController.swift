//
//  SuccViewController.swift
//  Shuttle
//
//  Created by Draveness on 5/16/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
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
    
    static let personResource = Resource<Person>(url: NSURL(string: "http://localhost:3000/people/1")!, parseJSON: { json in
        
        guard let dictionary = json as? JSONDictionary else { return nil }
        return Person(dictionary: dictionary)
    })
}


class SuccViewController: UIViewController, Guidelines {

    convenience required init<Person>(resource: Person) {
        self.init(nibName: nil, bundle: nil)
        print(resource)
    }

    override func viewDidLoad() {
        view.backgroundColor = UIColor.whiteColor()
        Webservice.load(Person.personResource) { (result) in
            print(result)
        }
    }

}
