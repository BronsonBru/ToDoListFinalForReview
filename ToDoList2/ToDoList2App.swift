//
//  ToDoList2App.swift
//  ToDoList2
//
//  Created by Bronson van den Broeck on 2022/08/23.
//

import SwiftUI

@main
struct ToDoList2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            let context = persistenceController.container.viewContext
            let dateHolder = DateHolder(context)
            
            TabView {
            TaskListView()
                    .tabItem{
                                Label("Tasks", systemImage: "list.star")
                            }.onAppear(){
                            }
                
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(dateHolder)
                
                    CompletionSummary()
                        .tabItem{
                            Label("Progress", systemImage: "checkmark.seal")
                        }.onAppear(){
                }
                
                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
                        .environmentObject(dateHolder)
                
                }
        }
      }
    }


