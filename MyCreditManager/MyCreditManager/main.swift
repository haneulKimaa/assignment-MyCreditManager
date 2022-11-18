//
//  main.swift
//  MyCreditManager
//
//  Created by 김하늘 on 2022/11/18.
//

import Foundation

private func getMenu() {
    print(Description.inputMenu)
    let readline = readLine()!
    switch readline {
    case "1":
        addStudent(readline)
    case "2":
        removeStudent(readline)
    case "3":
        removeStudent(readline)
    case "4":
        addStudent(readline)
    case "5":
        removeStudent(readline)
    case "X":
        endProgram()
    default:
        print(Description.inputError)
        getMenu()
    }
}

private func addStudent(_: String) {
    
}

private func removeStudent(_: String) {
    
}

private func addGrade(_: String) {
    
}

private func removeGrade(_: String) {
    
}

private func getGrade(_: String) {
    
}

private func endProgram() {
    exit(0)
}


getMenu()
