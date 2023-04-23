//
//  GridCell.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 23/04/2023.
//

import SwiftUI

struct GridCell: View {
    var cellData : String
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(.teal)
                .frame(height: 200)
                .overlay(
                    Text(cellData)
                        .foregroundColor(.white)
                )
        }
    }
}

struct GridCell_Previews: PreviewProvider {
    static var previews: some View {
        GridCell(cellData: "Some Data")
    }
}
