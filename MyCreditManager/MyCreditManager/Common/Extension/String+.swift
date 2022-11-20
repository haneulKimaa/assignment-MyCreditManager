//
//  String+.swift
//  MyCreditManager
//
//  Created by 김하늘 on 2022/11/18.
//

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
    
    func toGrade() -> Grade {
        switch self {
        case "A+":
            return Grade.APlus
        case "A":
            return Grade.A
        case "B+":
            return Grade.BPlus
        case "B":
            return Grade.B
        case "C+":
            return Grade.CPlus
        case "C":
            return Grade.C
        case "D+":
            return Grade.DPlus
        case "D":
            return Grade.D
        default:
            return Grade.F
        }
    }
    
}
