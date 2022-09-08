//
//  ContentView.swift
//  ToDoList2
//
//  Created by Bronson van den Broeck on 2022/08/23.
//

import SwiftUI
import CoreData

struct TaskListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder
    @State var selectedFilter = TaskFilter.NonCompleted
    @State var isArchived: Bool = false
    
    @State private var alertdelete = false
    
    var body: some View {
        NavigationView {
            VStack{
                DateScroller()
                    .padding()
                    .environmentObject(dateHolder)
                
                CategoryView()
                
                ZStack {
                    List {
                        ForEach(filteredTaskItems()) { taskItem in
                            HStack {
                                NavigationLink(destination: TaskEditView(passedTaskItem: taskItem, initialDate: Date()).environmentObject(dateHolder)) {
                                    
                                    TaskCell(passedTaskItem: taskItem)
                                        .environmentObject(dateHolder)
                                }
                                
                            }
                            .swipeActions(edge: .leading){
                                Button{
                                    //ArchiveFunc
                                    taskItem.isArchived.toggle()
                                    dateHolder.saveContext(viewContext)
                                    
                                }label: {
                                    Label("Archive", systemImage: "archivebox")
                                }.tint(.blue)
                            }
                            .swipeActions(edge: .trailing){
                                Button {
                                    //DeleteFunc
//                                    viewContext.delete(taskItem)
//                                    dateHolder.saveContext(viewContext)
                                    self.alertdelete = true
                                    
                                }label: {
                                    Label("Delete", systemImage: "trash")
                                }
                                .tint(.red)
                                
                                
                                
                            }.confirmationDialog("Are You Sure", isPresented: $alertdelete, titleVisibility: .hidden){
                                Button("Delete", role: .destructive) {
                                    //print("Item Deleted")
                                    viewContext.delete(taskItem)
                                    dateHolder.saveContext(viewContext)
                                    
                                }
                            }
                            
                        }
//                        .onDelete(perform: deleteItems)
                        
                    }
                    
                    .listStyle(PlainListStyle())
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Picker("", selection: $selectedFilter.animation()) {
                                ForEach(TaskFilter.allFilters, id: \.self) {
                                    filter in
                                    Text(filter.rawValue)
                                }
                            }
                        }
                        
                    }
                    
                    FloatingButton()
                        .environmentObject(dateHolder)
                    
                    
                }
            }.navigationTitle("Check It Off")
        }
        
    }
    
    func filteredTaskItems() -> [TaskItem]{
        if selectedFilter == TaskFilter.Completed{
            return dateHolder.taskItems.filter{ !$0.isArchived && $0.isCompleted()}
        }
        
        if selectedFilter == TaskFilter.NonCompleted{
            return dateHolder.taskItems.filter{ !$0.isArchived && !$0.isCompleted()}
        }
        
        if selectedFilter == TaskFilter.OverDue{
            return dateHolder.taskItems.filter{ !$0.isArchived && $0.isOverdue()}
        }
        
        if selectedFilter == TaskFilter.isArchived{
            return dateHolder.taskItems.filter{ $0.isArchived}
        }
        
        return dateHolder.taskItems.filter{ !$0.isArchived }
    }
    
    
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { filteredTaskItems()[$0] }.forEach(viewContext.delete)
//
//            dateHolder.saveContext(viewContext)
//        }
//    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
