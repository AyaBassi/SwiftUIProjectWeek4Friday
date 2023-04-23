//
//  BookSections.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 23/04/2023.
//

import SwiftUI

struct BookSections: View {
    let items = ["Section A","Section B","Section C","Section D","Section F","Section G","Section J","Section M"]
    
    
    let arr = Array(repeating: GridItem(.flexible()), count: 2)
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: arr,spacing: 8) {
                    ForEach(items,id:\.self){ item in
                        NavigationLink {
                            QuestionAndAnswersScreen()
                        } label: {
                            GridCell(cellData: item)
                        }
                    }
                }

            }
        }.padding([.leading,.trailing],10)
            .navigationTitle("Sections")
    }
}

struct BookSections_Previews: PreviewProvider {
    static var previews: some View {
        BookSections()
    }
}
