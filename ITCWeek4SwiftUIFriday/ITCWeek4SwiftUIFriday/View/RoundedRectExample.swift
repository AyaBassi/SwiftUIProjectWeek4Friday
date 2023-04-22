//
//  RoundedRectangle.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 22/04/2023.
//

import SwiftUI

struct RoundedRectExample: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30,style: .circular).frame(width: 200, height: 200, alignment: .leading)
            Text("Hello")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}

struct RoundedRectangle_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectExample()
    }
}
