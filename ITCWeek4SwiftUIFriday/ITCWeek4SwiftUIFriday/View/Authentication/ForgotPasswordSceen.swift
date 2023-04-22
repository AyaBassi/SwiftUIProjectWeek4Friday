//
//  ForgotPassword.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 22/04/2023.
//

import SwiftUI

struct ForgotPasswordSceen: View {
    
    @State var email:String = ""
    
    var body: some View {
        
        VStack (alignment:.leading,spacing: 20){
                TextField("Email", text: $email)
                .textFieldStyle(.plain).padding(.bottom,-10)
                Divider()
            
            // MARK: - Log In Button
            Button (action: {
                print("Handle Send Action!")
            }, label: {
                Text("Send").fontWeight(.heavy)
                    .font(.title3)
                    .frame(maxWidth: .infinity ,maxHeight: 40)
            })
                .buttonStyle(.borderedProminent)
                .tint(.orange)
            
            Text("Enter your E-mail and we will send you a new password")
                    .foregroundColor(.gray)
                    Spacer()
        }.frame(maxWidth: .infinity,alignment: .leading).padding([.leading,.trailing],30)
            .padding(.top,180)
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ForgotPasswordSceen()
    }
}
