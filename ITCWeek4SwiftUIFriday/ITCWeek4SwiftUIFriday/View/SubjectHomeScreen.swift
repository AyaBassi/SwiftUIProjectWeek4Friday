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
    let subjects = ["Programming", "Mathematics","Computer Science",
                    "Biology","Chemistry","Physics" , "Economics"]
    let imageNames = ["programmingImage","mathematicsImage","computerScienceImage",
                      "biologyImage","chemistryImage","physicsImage" , "economicsImage"]
    
    let programmingBookNames = ["Programming Book title A", "ProgramminBook title b","ProgrammingBook title C","ProgrammingBook title D"]
    let mathematicsBookNames = ["Mathematics Book title A", "Mathematics Book title b","MathematicsBook title C","MathematicsBook title D"]
  
    
 
    let physicsBookNames = ["Book title A", "Book title b","Book title C","Book title D"]
  
  var bookNamesToSend : [String] = [String]()
    
    var body: some View {
        
        VStack {
            List(Array(zip(subjects,imageNames)),id: \.self.0) {(subjectName,imageName) in
                
                NavigationLink {
                    BookTitle(selectedSubject: subjectName, nameOfSelectedImage: imageName)
                } label: {
                    ListCell(textLabel: subjectName,withImage: imageName)
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
