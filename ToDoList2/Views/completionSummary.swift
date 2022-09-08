//
//  completionSummary.swift
//  ToDoList2
//
//  Created by Zeynia Wax on 2022/09/06.
//

import SwiftUI

struct CompletionSummary: View {
   @EnvironmentObject var dateHolder: DateHolder
    
    
    @State var percentage: Float = 0.0
    @State var total: Float = 0.0
    @State var completion: Float = 0.0
//    var taskListView = TaskListView()
    
    var body: some View {
        VStack{
            Text("Daily Tasks Completed")
                .font(.title)
            
            ProgressBar(progress: self.$percentage,total:$total,completion:$completion
            ).frame(width: 225.0, height: 225.0)
                .padding(20.0).onAppear(){
                    
                    self.total = Float(dateHolder.taskItems.count)
                    print(total)
                    self.completion = Float(dateHolder.taskItems.filter{$0.isCompleted()}.count)
                    self.percentage = Float((completion/total))
                    print(completion)
                }.padding()
            
            Text("\(calc(value: percentage))%")
                .font(.title3)
        }
        }
    func calc(value: Float) -> String {
        return String(format: "%.0f", value * 100)
    }
}
    

struct ProgressBar:View{
    @Binding var progress: Float
    @Binding var total: Float
    @Binding var completion: Float
    var color: Color = Color.green
    
    var body: some View{
        ZStack{
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.20)
                .foregroundColor(Color.gray)
        Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress,1.0)))
                .stroke(style:StrokeStyle(lineWidth:12.0,lineCap:.round,lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut, value: 3.0)
                
                
}
}
    
}
    
 
 

    



struct CompletionSummary_Previews: PreviewProvider {
    static var previews: some View {
        CompletionSummary().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
