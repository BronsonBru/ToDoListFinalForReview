//
//  CategoryModel.swift
//  ToDoList2
//
//  Created by Bronson van den Broeck on 2022/09/07.
//

import SwiftUI

enum CategoryFilter: String{
    
    static var allCategoryFilters: [CategoryFilter]{
        return [.All, .Events, .Shopping, .Sports, .Studies]
    }
    
    case All = "All"
    case Events = "Events"
    case Shopping = "Shopping"
    case Sports = "Sports"
    case Studies = "Studies"
}
