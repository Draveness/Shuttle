//
//  ViewController.swift
//  Shuttle
//
//  Created by Draveness on 05/16/2016.
//  Copyright (c) 2016 Draveness. All rights reserved.
//

import UIKit
import Shuttle

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(frame: view.bounds)
        button.addTarget(self, action: #selector(ViewController.touch), forControlEvents: .TouchUpInside)
        button.setTitle("Push", forState: .Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        view.addSubview(button)
    }

    func touch() {
        Shuttle.launch("shuttle://succ/131313")
    }
}

