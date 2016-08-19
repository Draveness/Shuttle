//
//  TransferController.swift
//  Shuttle
//
//  Created by Draveness on 8/19/16.
//  Copyright © 2016 draveness. All rights reserved.
//

import Foundation

final public class TransferController: UIViewController {
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
    
    public init<A>(load: ((A?) -> ()) -> (), build: (A) -> UIViewController) {
        super.init(nibName: nil, bundle: nil)
        spinner.startAnimating()
        load() { [weak self] result in
            MainQueue {
                self?.spinner.stopAnimating()
                guard let value = result else { return } // TODO loading error
                let viewController = build(value)
                self?.add(content: viewController)
            }
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteColor()
        spinner.hidesWhenStopped = true
        view.addSubview(spinner)
        spinner.center = view.center
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func add(content content: UIViewController) {
            self.addChildViewController(content)
            self.view.addSubview(content.view)
            content.view.frame = self.view.frame
            content.didMoveToParentViewController(self)
    }
}
