//
//  SignUpScreen.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 22/04/2023.
//

import SwiftUI
enum Root2 {
    case homeScreen
}
struct SignUpScreen: View {
    let signUpViewModel = SignUpViewModel()
    
    @State var email: String = ""
    @State var password: String = ""
    @State var repeatPassword: String = ""
    @State var isChecked : Bool = false
   
    var body: some View {
            VStack (alignment:.leading,spacing: 20){
                
                // MARK: - Email TextField
                
                TextField("Email", text: $email)
                    .textFieldStyle(.plain)
                    .padding(.bottom,-10)
                Divider()
                
                // MARK: - Password TextField
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.plain)
                    .padding(.bottom,-10)
                Divider()
                
                // MARK: - Repeat password TextField
                
                SecureField("Repeat password", text: $repeatPassword)
                    .textFieldStyle(.plain)
                    .padding(.bottom,-10)
                Divider().padding(.bottom,40)

                // MARK: - The terms and condition section
                
                HStack{
                    
                    // MARK: - Check Button
                    
                    Button {
                        isChecked = !isChecked
                    } label: {
                        if isChecked{
                            Image(systemName: "checkmark.square").resizable().aspectRatio(contentMode: .fill).foregroundColor(Color.green).frame(width: 15, height: 15)
                        }else {
                            Image(systemName: "square").resizable().aspectRatio(contentMode: .fill).foregroundColor(Color.gray).frame(width: 15, height: 15)
                        }
                    }
                    
                    // MARK: - Label
                    Text("I agree all statments in")
                        .fontWeight(.bold)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    
                    // MARK: - terms of service Button
                    
                    NavigationLink {
                        TermsAndConditionInSwiftUIWebView()
                    } label: {
                        Text("terms of service")
                            .foregroundColor(.orange)
                            .fontWeight(.bold)
                            .font(.caption)
                            .underline()
                    }
                }.padding(.bottom,10)
                
                // MARK: - Sign Up Button
                
                Button (action: {
                    if isChecked {
                        
                        if signUpViewModel.isValidSigningIn(email: email, password: password, repeatPassword: repeatPassword){
                            print("Handle Sign Up!")
                        } else {
                            print("Wrong format of email or password")
                        }

                    }else {
                        print("Need to accept terms and condition")
                    }
                   
                }, label: {
                    Text("Sign Up").fontWeight(.heavy)
                        .font(.title3)
                        .frame(maxWidth: .infinity ,maxHeight: 40)
                })
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                
                // MARK: -
                
                Spacer()
                
            }.frame(maxWidth: .infinity,alignment: .leading).padding([.leading,.trailing],30)
                .padding(.top,100)
        
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
