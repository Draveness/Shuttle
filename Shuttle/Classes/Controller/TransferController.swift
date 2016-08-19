//
//  TransferController.swift
//  Shuttle
//
//  Created by 左书祺 on 8/19/16.
//  Copyright © 2016 draveness. All rights reserved.
//

import Foundation

final class LoadingViewController: UIViewController {
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
    
    init<A>(load: ((A?) -> ()) -> (), build: (A) -> UIViewController) {
        super.init(nibName: nil, bundle: nil)
        spinner.startAnimating()
        load() { [weak self] result in
            self?.spinner.stopAnimating()
            guard let value = result else { return } // TODO loading error
            let viewController = build(value)
            self?.add(content: viewController)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteColor()
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spinner)
        spinner.center = view.center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func add(content content: UIViewController) {
        addChildViewController(content)
        view.addSubview(content.view)
        content.view.translatesAutoresizingMaskIntoConstraints = false
        content.view.frame = view.frame
        content.didMoveToParentViewController(self)
    }
}
