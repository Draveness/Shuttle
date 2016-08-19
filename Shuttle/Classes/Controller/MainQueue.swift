//
//  MainQueue.swift
//  Shuttle
//
//  Created by Draveness on 8/19/16.
//  Copyright © 2016 draveness. All rights reserved.
//

import Foundation

func MainQueue(block: () -> ()) {
    dispatch_async(dispatch_get_main_queue(), block)
}