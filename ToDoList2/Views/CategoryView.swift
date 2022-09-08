//
//  CategoryView.swift
//  ToDoList2
//
//  Created by Bronson van den Broeck on 2022/09/07.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0){
                    ForEach(["All","Events","Shopping","Sports","Studies"], id: \.self){ tab in
                        Button {
                            withAnimation(.easeInOut){
        //                        currentTab = tab
                            }
                        } label: {
                            Text(tab)
        //                        .foregroundColor(currentTab == tab ? CustomColor.UCToffWhitecolor: CustomColor.UCTlightBluecolor)
                                .padding(.vertical,6)
                                .padding(.horizontal,20)
                                .background{
        //                            if currentTab == tab{
        //                                Capsule()
        //                                    .fill(CustomColor.UCTlightBluecolor)
        //                                    .matchedGeometryEffect(id: "TAB", in: animation)
        //                            }
                                }.contentShape(Capsule())
                        }
                        
                    }
                }
                .padding(.bottom, 5)
            }
        }
    }


struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
