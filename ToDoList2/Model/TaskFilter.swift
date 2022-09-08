//
//  TaskFilter.swift
//  ToDoList2
//
//  Created by Bronson van den Broeck on 2022/08/24.
//

import SwiftUI

enum TaskFilter: String{
    
    static var allFilters: [TaskFilter]{
        return [.NonCompleted, .Completed, .OverDue, .All, .isArchived]
    }
    
    case All = "All"
    case NonCompleted = "To Do"
    case Completed = "Completed"
    case OverDue = "Overdue"
    case isArchived = "Archived"
}
