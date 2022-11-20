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
        addGrade()
    case "4":
        removeGrade()
    case "5":
        getGrade()
    case "X":
        endProgram()
    default:
        print(Description.inputError)
        getMenu()
    }
}

private func addStudent() {
    
}

private func removeStudent() {
    
}

private func addGrade() {
    
}

private func removeGrade() {
    
}

private func getGrade() {
    
}

private func endProgram() {
    exit(0)
}


getMenu()
