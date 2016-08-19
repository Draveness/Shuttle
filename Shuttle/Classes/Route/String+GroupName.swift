//
//  String+GroupName.swift
//  Pods
//
//  Created by Draveness on 5/17/16.
//
//

import Foundation

extension String {
    func groupNames() -> [String] {
        var groupNames: [String] = []

        let componentRegex = try! NSRegularExpression(pattern: ShuttleRegexURLComponentPattern, options: [])
        let matches = componentRegex.matchesInString(self, options: [], range: NSRange(location: 0, length: self.characters.count))
        matches.forEach({ (result: NSTextCheckingResult) in
            let groupName = (self as NSString).substringWithRange(result.range)
            groupNames.append(groupName)
        })

        return groupNames
    }
    
}