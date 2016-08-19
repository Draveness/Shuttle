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
        guard let relativePath = NSURL(string: self)?.relativePath,
              let componentRegex = try? NSRegularExpression(pattern: ShuttleRegexURLComponentPattern, options: []) else { return [] }
        
        var groupNames: [String] = []

        let matches = componentRegex.matchesInString(relativePath, options: [], range: NSRange(location: 0, length: relativePath.characters.count))
        matches.forEach({ (result: NSTextCheckingResult) in
            let groupName = (relativePath as NSString).substringWithRange(result.range)
            groupNames.append(groupName)
        })

        return groupNames
    }
    
}