//
//  SubjectHomeScreen.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 21/04/2023.
//

// sending data forward: create variable without giving default values
// only for


import SwiftUI

struct SubjectHomeScreen: View {
    var email:String
    let subjects = ["Programming", "Mathematics","Computer Science","Biology","Chemistry","Physics" , "Economics"]
    let imageNames = ["programmingImage", "mathematicsImage","computerScienceImage","biologyImage","chemistryImage","physicsImage" , "economicsImage"]
    
    let bookNames = ["Book title A", "Book title b","Book title C","Book title D"]
    var body: some View {
        VStack {
            
            List(Array(zip(subjects,imageNames)),id: \.self.0) {(subject,imageName) in
                NavigationLink {
                    BookTitle(bookTitle: "Some title", bookNames: bookNames)
                } label: {
                    ListCell(textLabel: subject,imageName: imageName)
                }

                
            }
        }
        .navigationTitle(Text(email))
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        SubjectHomeScreen(email: "Email")
    }
}
