//
//  CategoryView.swift
//  ToDoList2
//
//  Created by Bronson van den Broeck on 2022/09/07.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var dateHolder: DateHolder
    @State var selectedCategoryFilter = CategoryFilter.All
    @Binding var selectedCategory : String
    @Binding var isCategoryFiltered : Bool
    @Binding var isCategoryAll : Bool
    
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0){
                    ForEach(["All","Work","Studies","Shopping","Fun"], id: \.self){ tab in
                        Button {
                            withAnimation(.easeInOut){
                                selectedCategory = tab
                                isCategoryFiltered = true
                                if tab == "All" {
                                    isCategoryAll = true
                                   
                                } else {
                                    isCategoryAll = false
                                    
                                }
                            }
                            print(selectedCategory)
                        } label: {
                            Text(tab)
       
                                .padding(.vertical,6)
                                .padding(.horizontal,20)
                                .background{
                                }.contentShape(Capsule())
                        }
                        
                    }
                }
                .padding(.bottom, 5)
            }
        }
  
    
    }


//struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryView()
//    }
//}
