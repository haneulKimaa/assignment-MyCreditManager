//
//  Student.swift
//  MyCreditManager
//
//  Created by 김하늘 on 2022/11/18.
//

class StudentInfo {
    var subject: [String: String] {
        willSet {
            totalGrade = getTotalGrade(newSubject: newValue)
        }
    }
    var totalGrade: Double?
    
    init(subject: [String : String]) {
        self.subject = subject
    }

    private func getTotalGrade(newSubject: [String:String]) -> Double? {
        if !newSubject.isEmpty {
            var totalGrade: Double = 0
            for subject in newSubject {
                totalGrade += subject.value.toGrade().rawValue
            }
            return totalGrade/Double(newSubject.count)
        }
        return nil
    }
}
