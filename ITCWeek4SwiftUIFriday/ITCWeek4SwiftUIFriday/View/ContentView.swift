//
//  ContentView.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 21/04/2023.
//

import SwiftUI

struct ContentView: View {
    let title = "Log In"
    @State var email : String = ""
    @State var password : String = ""
    @State var path = [Root]()
    let loginViewModel = LoginViewModel()
    var body: some View {
        
        NavigationStack(path: $path) {
            VStack {
                Text(title)
                    .font(.title)
                    .padding()
                Spacer(minLength: 100)
                
                Group{
                    TextField("Email", text: $email)
                        .textFieldStyle(.plain)
                        .padding(2)
                    Divider().padding(.bottom,30)
                }.padding([.leading,.trailing],20)
                
                Group{
                    SecureField("Password", text: $password)
                        .textFieldStyle(.plain)
                    Divider().padding(.bottom,50)
                }.padding([.leading,.trailing],20)
                
                
                Button (action: {
                    if loginViewModel.isValidLoggingIn(email: email, password: password){
                        path.append(.homeScreen)
                    }else {
                        print("Failed to validate login")
                    }
                }, label: {
                    Text("Submit")
                        .frame(maxWidth: .infinity )
                }).padding(10)
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                Spacer()
            }
            
            .padding()
            .navigationDestination(for: Root.self) { navigate in
                switch navigate {
                case .homeScreen:
                    HomeScreen()
                    
                }
            }
        }
    }
    enum Root {
        case homeScreen
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
