//
//  File.swift
//  EZ.Apple
//
//  Created by Herry on 2023/05/09.
//

import SwiftUI

// Task Model and Sample Tasks...

struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()

}

// Total
struct TaskMetaData: Identifiable {
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date

}

// sample Date for Testing
func getSampleData(offset: Int) -> Date {
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
    
}

var tasks: [TaskMetaData] = [
    TaskMetaData(task: [
        Task(title: "Talk to iJustine1"),
        Task(title: "iPhone 13 Greate Design Change1"),
        Task(title: "1.Nothing Much Workout!!!")
    ], taskDate: getSampleData(offset: 1)),
    
    TaskMetaData(task: [
        Task(title: "Talk to iJustine2"),
        Task(title: "iPhone 13 Greate Design Change2"),
        Task(title: "2.Nothing Much Workout!!!")
    ], taskDate: getSampleData(offset: 2)),
    
    TaskMetaData(task: [
        Task(title: "Talk to iJustine3"),
        Task(title: "iPhone 13 Greate Design Change3"),
        Task(title: "3.Nothing Much Workout!!!")
    ], taskDate: getSampleData(offset: 20))
]
