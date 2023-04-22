//
//  BookTitle.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 22/04/2023.
//

import SwiftUI

struct BookTitle: View {
    var bookTitle:String
    
    var bookNames :[String]
    
    var body: some View {

        VStack {
            List(bookNames,id: \.self) { name in
                ListCell(textLabel: name, imageName: "physicsImage")
            }
            .navigationTitle(bookTitle)
        }
    }
}

struct BookTitle_Previews: PreviewProvider {
    static var previews: some View {
        BookTitle(bookTitle: "", bookNames: [])
    }
}
