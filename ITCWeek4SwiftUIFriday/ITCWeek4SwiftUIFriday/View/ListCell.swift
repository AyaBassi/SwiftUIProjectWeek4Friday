//
//  ListCell.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 22/04/2023.
//

import SwiftUI

struct ListCell: View {
    let textLabel : String
    
    let imageName : String
    
    var body: some View {
        HStack {
            Image(imageName)
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
        ListCell(textLabel: "Mathematics", imageName: "chemistryImage")
    }
}
