//
//  UIViewController+NavigationController.swift
//  Pods
//
//  Created by Draveness on 5/16/16.
//
//

import UIKit

extension UIViewController {

    class func topMostNavigationController() -> UINavigationController? {
        return self.topMostViewController()?.navigationController
    }

    class func topMostViewController() -> UIViewController? {
        let rootViewController = UIApplication.sharedApplication().windows.first?.rootViewController
        return self.topMostViewControllerOfViewController(rootViewController)
    }

    class func topMostViewControllerOfViewController(viewController: UIViewController?) -> UIViewController? {
        if let tabBarController = viewController as? UITabBarController,
            let selectedViewController = tabBarController.selectedViewController {
            return self.topMostViewControllerOfViewController(selectedViewController)
        }

        if let navigationController = viewController as? UINavigationController,
            let visibleViewController = navigationController.visibleViewController {
            return self.topMostViewControllerOfViewController(visibleViewController)
        }

        if let presentedViewController = viewController?.presentedViewController {
            return self.topMostViewControllerOfViewController(presentedViewController)
        }

        for subview in viewController?.view?.subviews ?? [] {
            if let childViewController = subview.nextResponder() as? UIViewController {
                return self.topMostViewControllerOfViewController(childViewController)
            }
        }

        return viewController
    }
    
}