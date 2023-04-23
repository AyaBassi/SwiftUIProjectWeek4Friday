//
//  BookTitle.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 22/04/2023.
//

import SwiftUI


// Notes: For multiple if statements in sections the building in indexing takes for ever

struct BookTitle: View {
    
    var selectedSubject:String
    var nameOfSelectedImage:String
    let sectionss : [Level] = [Level(levelName: "GCSE"),Level(levelName: "ASLevel"),
                               Level(levelName: "ALevel")]
    let sections: [String] = ["GCSE", "ASLevel"//, "ALevel"
    ]
    let gcseBooks : [String] = ["GCSE A Book","GCSE Book B","GCSE Book C"]
    let aSLevelBooks : [String] = ["AS Book A","AS  Book B","AS Book C"]
    let a2LevelBooks : [String] = ["A2 Book A","A2 Book B","A2 Book C"]
    let gcseBookImageNames = ["gcseProgrammingImage","gcseProgrammingImage2","gcseProgrammingImage3"]
    let aSBookImageNames = ["ASProgrammingImage","ASProgrammingImage2","ASProgrammingImage3"]
    //let urls = [""]
   
    var body: some View {

        VStack {
            
            List{
                ForEach(sectionss){ sec in
                    Section(header:Text(sec.levelName)){
                        if sec.levelName == "GCSE"{
                            ForEach(gcseBooks, id: \.self) { bookName in
                                NavigationLink {
                                    BookSections()
                                } label: {
                                    ListCell(textLabel: bookName, withImage: "gcseProgrammingImage")
                                }
                            }
                        }
                        else if sec.levelName == "ASLevel" {
                            ForEach(aSLevelBooks, id: \.self) { bookName in
                                NavigationLink {
                                    BookSections()
                                } label: {
                                    ListCell(textLabel: bookName, withImage: "gcseProgrammingImage2")
                                }
                            }
                        }
                         else{
                            ForEach(a2LevelBooks, id: \.self) { myBook in
                                NavigationLink {
                                    BookSections()
                                } label: {
                                    ListCell(textLabel: myBook, withImage: "gcseProgrammingImage3")
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(selectedSubject)
        }
    }
}

struct BookTitle_Previews: PreviewProvider {
    static var previews: some View {
        BookTitle(selectedSubject: "", nameOfSelectedImage: "")
    }
}
