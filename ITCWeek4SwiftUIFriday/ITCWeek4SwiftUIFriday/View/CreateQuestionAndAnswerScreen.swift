//
//  CreateQuestionAndAnswerScreen.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 24/04/2023.
//

import SwiftUI

struct CreateQuestionAndAnswerScreen: View {
    var ques : String = ""
    @Binding var isShown : Bool
    @Binding var myQuestion : String
    @Binding var myAnswer : String
    
    var body: some View {
            VStack{
                HStack{
                    Button {
                        isShown.toggle()
                    } label: {
                        Text("X")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .padding()
                    }
                    Spacer()
                }
                
                Group{
                    TextField("Write your question here ...", text: $myQuestion).textFieldStyle(.roundedBorder)
                    
                    TextField("Write you answer here ...", text: $myAnswer).textFieldStyle(.roundedBorder)
                }.padding()
                
                Button {
                    isShown.toggle()
                } label: {
                    Text("Done").frame(maxWidth: .infinity,maxHeight: 40)
                        .buttonStyle(.borderedProminent)
                        .background(.teal)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }

                
                Spacer()
            }
    }
    
}

struct CreateQuestionAndAnswerScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateQuestionAndAnswerScreen(isShown: .constant(true)
                                      ,myQuestion: .constant(""),
                                      myAnswer: .constant(""))
    }
}
