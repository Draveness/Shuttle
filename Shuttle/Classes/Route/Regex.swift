//
//  STRegularExpression.swift
//  Pods
//
//  Created by Draveness on 5/16/16.
//
//

import UIKit

let ShuttleRegexURLComponentPattern = ":[a-zA-Z0-9-_][^/]+"

class Regex: NSRegularExpression {

    let groupNames: [String]
    let originalPattern: String

    init(_ pattern: String) {
        self.groupNames = pattern.groupNames()
        self.originalPattern = pattern
        var cleanedPattern: String = pattern
        for nameGroup in self.groupNames {
            cleanedPattern = cleanedPattern.stringByReplacingOccurrencesOfString(nameGroup, withString: "[a-zA-Z0-9-_][^/]+")
        }
        try! super.init(pattern: cleanedPattern, options: [])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func isMatch(string: String) -> Bool {
        if let textResult = self.firstMatchInString(string, options: [], range: NSRange(location: 0, length: string.characters.count)) {
            return true
        }
        return false
    }

    func matchResult(string: String) -> [String : AnyObject] {
        var result: [String : AnyObject] = [:]
        if isMatch(string) {
            let patterns = self.originalPattern.componentsSeparatedByString("/")
            let substrings = string.componentsSeparatedByString("/")

            let length = min(patterns.count, substrings.count)
            for index in 0..<length {
                let pattern = patterns[index].stringByReplacingOccurrencesOfString(":", withString: "")
                let substring = substrings[index]
                if pattern != substring {
                    result[pattern] = substring
                }
            }
        }
        return result
    }

}
