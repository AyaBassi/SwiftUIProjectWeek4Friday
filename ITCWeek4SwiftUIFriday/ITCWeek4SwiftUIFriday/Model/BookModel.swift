//
//  BookModel.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 23/04/2023.
//

import Foundation

struct Subject : Identifiable {
    let id = UUID()
    let subjectName : String
    let subjectImageName : String
    let subject:[BookModel]
}

struct BookModel:Identifiable {
    let id = UUID()
    let bookName:String
    let bookImageName:String
}

struct Level : Identifiable{
    let id = UUID()
    let levelName: String
}


