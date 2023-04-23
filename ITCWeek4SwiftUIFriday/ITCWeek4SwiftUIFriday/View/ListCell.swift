//
//  ListCell.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 22/04/2023.
//

import SwiftUI

struct ListCell: View {
    let textLabel : String
    let withImage : String
    
    var body: some View {
        HStack {
            Image(withImage)
                .resizable()
                .frame(maxWidth: 70,maxHeight: 70)
                .cornerRadius(10)
                .foregroundColor(Color.cyan)
            Text(textLabel)
                .foregroundColor(.orange)
                .fontWeight(.light)
        }
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(textLabel: "Mathematics", withImage: "chemistryImage")
    }
}
