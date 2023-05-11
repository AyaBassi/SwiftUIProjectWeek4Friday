//
//  ContentView.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 21/04/2023.
//
// A@gmail.com
// 123456

import SwiftUI
///Notes
///navigation links can not handle login so we should use buttons
enum Root {
    case subjectHomeScreen
    case signInWithFaceBook
    case signInWithGoogle
}

struct LoginScreen: View {
    let title = "Log In"
    
    @State var email : String = ""
    @State var password : String = ""
    @State var path = [Root]()
    let loginViewModel = LoginViewModel()
    
    var body: some View {
        
        NavigationStack(path: $path) {
            //ScrollView{
                VStack {
                    Group{
                        TextField("Email", text: $email)
                            .textFieldStyle(.plain)
                            .padding(2)
                            .padding(.top,100)
                        Divider().padding(.bottom,16)
                    }.padding([.leading,.trailing],20)
                        
                    Group{
                        SecureField("Password", text: $password)
                            .textFieldStyle(.plain)
                        Divider().padding(.bottom,30)
                    }.padding([.leading,.trailing],20)
                    
                    // MARK: - Log In Button
                    if loginViewModel.returningAvailableBiometricType() != .none {
                        // show facial id button
                        Button {
                            print("loging")
                            
                            loginViewModel.authenticateWithBiometric { result in
                                switch result {
                                case .success(_):
                                    // success so log user in
                                    path.append(.subjectHomeScreen)
                                case .failure(_):
                                    print("failed to ")
                                }
                            }
                            
                        } label: {
                            loginViewModel.returningAvailableBiometricType() == .face ?
                            Image(systemName: "faceid")
                                .resizable().frame(maxWidth: 50,maxHeight: 50)
                            : Image(systemName: "hand.thumbsup.circle")
                                .resizable().frame(maxWidth: 50,maxHeight: 50)
                        }
                    }else {
                        
                        // show normal login button
                        Button (action: {
                            if loginViewModel.isValidLoggingIn(email: email, password: password) && loginViewModel.isCorrectEmailAndPassword(email: email , password: password, aKeychainManager: KeychainManager()){
                                path.append(.subjectHomeScreen)
                            }else {
                                print("Failed to validate login")
                            }
                        }, label: {
                            Text("Log In").fontWeight(.heavy)
                                .font(.title3)
                                .frame(maxWidth: .infinity ,maxHeight: 40)
                        }).padding()
                            .buttonStyle(.borderedProminent)
                            .tint(.orange)
                    }
                    
                    // MARK: - Forgot the password? Navigation Link
                    
                    NavigationLink {
                        ForgotPasswordSceen()
                    } label: {
                        Text("Forgot the password?")
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        VStack {
                            Divider()
                        }
                        Text("or")
                            .font(.caption)
                            .foregroundColor(Color(UIColor.systemGray))
                        VStack {
                            Divider()
                        }
                    }.padding()
                    
                    
                    // MARK: - Sing In with Facebook Button
                    Group{
                        HStack{
                            Image("facebookLogo")
                                .resizable().frame(maxWidth: 20, maxHeight: 20)
                            Button {
                                path.append(.signInWithFaceBook)
                            } label: {
                                Text("Sign in with FaceBook")
                            }.padding()
                        }.frame(maxWidth: .infinity)
                        
                        
                        // MARK: - Sign In with Google Button
                        HStack{
                            Image("googleImage")
                                .resizable().frame(maxWidth: 20, maxHeight: 20)
                            Button {
                                path.append(.signInWithGoogle)
                            } label: {
                                Text("Sign in with Google")
                                    .foregroundColor(.black).padding(.trailing,18)
                            }.padding()
                        }.frame(maxWidth: .infinity)
                    }
                    
                    Spacer()
                    
                    // MARK: - SignUp Button NavigationLink
                    NavigationLink {
                        SignUpScreen()
                    } label: {
                        Text("Don't have account yet?")
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                        Text("Sign Up")
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                    }
                }
            //}
            
            .padding()
            
            .navigationDestination(for: Root.self) { navigate in
                switch navigate {
                case .subjectHomeScreen: SubjectHomeScreen(email: email)
                case .signInWithFaceBook: SignInWithFaceBookScreen()
                case .signInWithGoogle: SignInWithGoogleScreen()
                }
            }
            .navigationTitle(Text("Login"))
            //.navigationBarTitleDisplayMode(.inline)
            //.navigationBarTitleDisplayMode(.automatic)
            //.navigationBarTitleDisplayMode(.large)
        }
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
