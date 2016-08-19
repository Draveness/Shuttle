//
//  ViewController.swift
//  Shuttle
//
//  Created by Draveness on 05/16/2016.
//  Copyright (c) 2016 Draveness. All rights reserved.
//

import UIKit
import Shuttle

class ViewController: UITableViewController {
    
    var resource: [Person]?
    
    convenience required init(resource: [Person]) {
        self.init(nibName: nil, bundle: nil)
        print(resource)
        
        self.resource = resource
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resource?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = resource![indexPath.row].name
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        Shuttle.launch("http://localhost:3000/people/\(indexPath.row + 1)")
    }
}

