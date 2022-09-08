//
//  TaskItemExtension.swift
//  ToDoList2
//
//  Created by Bronson van den Broeck on 2022/08/23.
//

import SwiftUI

extension TaskItem{
    func isCompleted() -> Bool{
        return completedDate != nil
    }
    
    func isOverdue() -> Bool{
        if let due = dueDate{
            return !isCompleted() && scheduleTime && due < Date()
        }
        return false
    }
    
    func overDueColor() -> Color {
        return isOverdue() ? .red : .black
    }
    
    func dueDateTimeOnly() -> String{
        if let due = dueDate{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            return dateFormatter.string(from: due)
        }
        
        return ""
    }
}
