//
//  SuccViewController.swift
//  Shuttle
//
//  Created by Draveness on 5/16/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import Shuttle

class SuccViewController: UIViewController, Guidelines {

    convenience required init<Person>(resource: Person) {
        self.init(nibName: nil, bundle: nil)
        print(resource)
    }

    override func viewDidLoad() {
        view.backgroundColor = UIColor.yellowColor()
    }

}
