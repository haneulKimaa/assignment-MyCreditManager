//
//  String+.swift
//  MyCreditManager
//
//  Created by 김하늘 on 2022/11/18.
//

import Foundation

extension String {
    
    func isEnglishOrNumType() -> Bool {
        let pattern = "[a-z0-9A-Z]*"
        let resultRange = self.range(of: pattern, options: .regularExpression)
        if let result = resultRange {
            return self[result].count == self.count
        }
        else {
            return false
        }
    }
    
}
