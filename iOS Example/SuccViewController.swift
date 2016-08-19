//
//  SuccViewController.swift
//  Shuttle
//
//  Created by Draveness on 5/16/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import Shuttle

class SuccViewController: UIViewController {
    
    let identifierLabel: UILabel = UILabel()
    let nameLabel: UILabel = UILabel()

    convenience required init(resource: Person) {
        self.init(nibName: nil, bundle: nil)
        print(resource)
        
        identifierLabel.text = "\(resource.id)"
        identifierLabel.sizeToFit()

        nameLabel.text = resource.name
        nameLabel.sizeToFit()

        identifierLabel.center = CGPoint(x: view.center.x, y: view.center.y - 50)
        nameLabel.center = CGPoint(x: view.center.x, y: view.center.y + 50)
        
        view.addSubview(identifierLabel)
        view.addSubview(nameLabel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
