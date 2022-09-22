//
//  CategoryModel.swift
//  ToDoList2
//
//  Created by Bronson van den Broeck on 2022/09/07.
//

import SwiftUI

enum CategoryFilter: String{
    
    static var allCategoryFilters: [CategoryFilter]{
        return [.All, .Work, .Shopping, .Studies, .Fun]
    }
    
    case All = "All"
    case Work = "Work"
    case Shopping = "Shopping"
    case Studies = "Studies"
    case Fun = "Fun"
}
