//
//  main.swift
//  MyCreditManager
//
//  Created by 김하늘 on 2022/11/18.
//

import Foundation

var studentList: [String : StudentInfo] = [:]

private func getMenu() {
    print(Description.inputMenu)
    let readline = readLine()!
    switch readline {
    case "1":
        addStudent()
    case "2":
        removeStudent()
    case "3":
        updateGrade()
    case "4":
        removeGrade()
    case "5":
        getGrade()
    case "X":
        endProgram()
    default:
        print(Description.wrongMenuAnswer)
        getMenu()
    }
}

private func addStudent() {
    print(Description.addStudent)
    let readline = String(readLine()!)

    if checkError(errorType: .basicInput, value: readline) {
        getMenu()
        return
    }
    
    if checkError(errorType: .studentNameExist, value: readline) {
        print("\(readline)\(Description.addStudentError)")
        getMenu()
        return
    }
    
    studentList[readline] = StudentInfo(subject: [:])
    print("\(readline) \(Description.addStudentSuccess)")
    getMenu()
}

private func removeStudent() {
    print(Description.removeStudent)
    let readline = String(readLine()!)
    
    if checkError(errorType: .basicInput, value: readline) {
        getMenu()
        return
    }
    
    if !checkError(errorType: .studentNameExist, value: readline) {
        print("\(readline) \(Description.studentNameError)")
        getMenu()
        return
    }
    
    studentList.removeValue(forKey: readline)
    print("\(readline) \(Description.removeStudentSuccess)")
    getMenu()
}

private func updateGrade() {
    print(Description.addGrade)
    let readline = String(readLine()!)
    let values = readline.split(separator: " ").map { String($0) }
    
    if checkError(errorType: .basicInput, value: values[0]) {
        getMenu()
        return
    }
    
    if checkError(errorType: .propertyCount, value: "\(values.count != 3)") {
        getMenu()
        return
    }
    
    if !checkError(errorType: .studentNameExist, value: values[0]) {
        print("\(values[0]) \(Description.studentNameError)")
        getMenu()
        return
    }
    
    let info = studentList[values[0]]!
    info.subject.updateValue(values[2], forKey: values[1])
    studentList.updateValue(info, forKey: values[0])
    print("\(values[0]) 학생의 \(values[1]) 과목이 \(values[2])로 추가(변경)되었습니다.")
    getMenu()
}

private func removeGrade() {
    print(Description.removeGrade)
    let readline = String(readLine()!)
    let values = readline.split(separator: " ").map { String($0) }
    
    if checkError(errorType: .basicInput, value: values[0]) {
        getMenu()
        return
    }
    
    if checkError(errorType: .propertyCount, value: "\(values.count != 2)") {
        getMenu()
        return
    }
    
    if !checkError(errorType: .studentNameExist, value: values[0]) {
        print("\(values[0]) \(Description.studentNameError)")
        getMenu()
        return
    }

    let info = studentList[values[0]]!
    info.subject.removeValue(forKey: values[1])
    studentList.updateValue(info, forKey: values[0])
    print("\(values[0]) 학생의 \(values[1]) 과목의 성적이 삭제되었습니다.")
    getMenu()
}

private func getGrade() {
    print(Description.getGrade)
    let readline = String(readLine()!)
    
    if checkError(errorType: .basicInput, value: readline) {
        getMenu()
        return
    }
    
    if !checkError(errorType: .studentNameExist, value: readline) {
        print("\(readline) \(Description.studentNameError)")
        getMenu()
        return
    }
    
    for subject in studentList[readline]!.subject {
        print("\(subject.key): \(subject.value)")
    }
    print("평점 : \(studentList[readline]!.totalGrade ?? 0.0)")
    getMenu()
}

private func endProgram() {
    exit(0)
}

private func checkError(errorType: ErrorType, value: String) -> Bool {
    var errorResult: Bool = false
    switch errorType {
    case .propertyCount:
        if Bool(value)! {
            print(Description.inputError)
            errorResult = true
        }
    case .basicInput:
        if !value.isEnglishOrNumType() {
            print(Description.inputError)
            errorResult = true
        }
    case .studentNameExist:
        if studentList.keys.contains(value) {
            errorResult = true
        }
    }
    return errorResult
}

getMenu()
