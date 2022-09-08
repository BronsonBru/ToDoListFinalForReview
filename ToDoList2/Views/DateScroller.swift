//
//  DateScroller.swift
//  ToDoList2
//
//  Created by Bronson van den Broeck on 2022/08/24.
//

import SwiftUI

struct DateScroller: View {
    @EnvironmentObject var dateHolder: DateHolder
    @Environment(\.managedObjectContext) private var viewContext
    var body: some View {
        HStack{
            Spacer()
            Button(action: moveBack){
                Image(systemName: "arrow.left")
                    .imageScale(.small)
                    .font(Font.title.weight(.bold))
                    .foregroundColor(.black)
            }
            Text(dateFormatted())
                .font(.title)
                .bold()
                .animation(.none)
                .frame(maxWidth: .infinity)
            Button(action: moveForward){
                Image(systemName: "arrow.right")
                    .imageScale(.small)
                    .font(Font.title.weight(.bold))
                    .foregroundColor(.black)
            }
        }
    }
    
    func dateFormatted() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd LLL yy"
        return dateFormatter.string(from: dateHolder.date)
    }
    
    func moveBack(){
        withAnimation{
            dateHolder.moveDate(-1, viewContext)
        }
    }
    
    func moveForward(){
        withAnimation{
            dateHolder.moveDate(1, viewContext)
        }
    }
}

struct DateScroller_Previews: PreviewProvider {
    static var previews: some View {
        DateScroller()
    }
}
