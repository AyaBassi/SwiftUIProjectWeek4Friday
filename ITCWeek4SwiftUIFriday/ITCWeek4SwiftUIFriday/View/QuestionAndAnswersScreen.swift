//
//  QuestionAndAnswersScreen.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 23/04/2023.
//

import SwiftUI

struct QuestionAndAnswersScreen: View {
    @State var answer:String = ""
    @State var givenAnswer : String = ""
    @State var question :String = "What is 4 * 4 ?"
    let imageUrl = "https://media.istockphoto.com/id/1413840933/photo/old-books-on-wooden-shelf-tiled-bookshelf-background-concept-on-the-theme-of-history.jpg?b=1&s=612x612&w=0&k=20&c=wSw2dBYfChbj5EFgd8xcxe3lJWLjLeMvfHSdOqNOVEs="
    
    @State var createQuestionPageIsShown = false
    
    var body: some View {
        //ScrollView{
            VStack(spacing: 5){
                HStack{
                    Spacer()
                    Button {
                        createQuestionPageIsShown = true
                    } label: {
                        Text("+").font(.largeTitle)
                    }.padding(.trailing,10)
                }
                
                Text(question).frame(maxWidth: .infinity,alignment: .leading).padding([.leading,.trailing],2)
                
                ZStack{
                    AsyncImage(url: URL(string: imageUrl)) { image in
                        image.resizable()
                            .aspectRatio( contentMode: .fill)
                            .frame(maxWidth: .infinity, maxHeight: 300)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Image(systemName: "play.circle").resizable().frame(maxWidth: 100, maxHeight: 100).foregroundColor(.white)
                }
                
                HStack{
                    Spacer()
                    Text("Score: 13")
                    
                }.frame(maxWidth: .infinity,alignment: .leading).padding([.leading,.trailing],2)
                
                TextField("Type your Answer..", text: $givenAnswer)
                    .textFieldStyle(.roundedBorder)
                    .padding([.leading,.trailing],2)
                
                Button {
                    if givenAnswer == answer {
                        print("Correct")
                    }else {
                        print("Wrong")
                    }
                } label: {
                    Text("Submit")
                        .frame(maxWidth: .infinity,maxHeight: 45)
                        .buttonStyle(.borderedProminent)
                        .background(.mint)
                        .foregroundColor(.white).cornerRadius(10)
                        .padding([.leading,.trailing],20).padding(.top,10).font(.title3)
                }
                Spacer()
            }
        //}
            .sheet(isPresented: $createQuestionPageIsShown) {
                CreateQuestionAndAnswerScreen(isShown: $createQuestionPageIsShown, myQuestion: $question, myAnswer: $answer)
            }
    }
}

struct QuestionAndAnswersScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuestionAndAnswersScreen()
    }
}
