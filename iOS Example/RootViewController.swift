//
//  RootViewController.swift
//  Shuttle
//
//  Created by 左书祺 on 8/19/16.
//  Copyright © 2016 draveness. All rights reserved.
//

import UIKit
import Shuttle

class RootViewController: UIViewController {
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        Shuttle.launch("http://localhost:3000/people")
    }
}