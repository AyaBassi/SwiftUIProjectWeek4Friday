//
//  SwiftUIExamples.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 22/04/2023.
//

import SwiftUI

struct SwiftUIExamples: View {
    var body: some View {
        VStack(alignment: .trailing, spacing: 50){
            Image(systemName: "globe")
                .renderingMode(.original).resizable()
                .frame(width: 100,height: 100)
                .foregroundColor(Color.yellow)
                
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            
        }.frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.cyan)
    
    }
}

struct SwiftUIExamples_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIExamples()
    }
}
