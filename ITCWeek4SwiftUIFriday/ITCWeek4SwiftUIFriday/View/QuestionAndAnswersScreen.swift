//
//  QuestionAndAnswersScreen.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 23/04/2023.
//

import SwiftUI

struct QuestionAndAnswersScreen: View {
    @State var answer:String = ""
    let imageUrl = "https://media.istockphoto.com/id/1413840933/photo/old-books-on-wooden-shelf-tiled-bookshelf-background-concept-on-the-theme-of-history.jpg?b=1&s=612x612&w=0&k=20&c=wSw2dBYfChbj5EFgd8xcxe3lJWLjLeMvfHSdOqNOVEs="
    var body: some View {
        //ScrollView{
            VStack(spacing: 5){
                
                Text("What is 4 * 4 asdkfla lasd lsjdf alkasjd lkasjdf asdkjfalsdf  ?").frame(maxWidth: .infinity,alignment: .leading).padding([.leading,.trailing],2)
                
                ZStack{
                    AsyncImage(url: URL(string: imageUrl)) { image in
                        image.resizable().aspectRatio( contentMode: .fill).frame(maxWidth: .infinity, maxHeight: 300)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Image(systemName: "play.circle").resizable().frame(maxWidth: 100, maxHeight: 100).foregroundColor(.white)
                }
                
                HStack{
                    Spacer()
                    Text("Score: 13")
                    
                }.frame(maxWidth: .infinity,alignment: .leading).padding([.leading,.trailing],2)
                
                TextField("Type your Answer..", text: $answer)
                    .textFieldStyle(.roundedBorder)
                    .padding([.leading,.trailing],16)
                
                Button {
                    print(answer)
                } label: {
                    Text("Submit")
                        .frame(maxWidth: .infinity,maxHeight: 40)
                        .buttonStyle(.borderedProminent)
                        .background(.mint)
                        .foregroundColor(.white).cornerRadius(10).padding()
                }
                Spacer()
            }
        //}
    }
}

struct QuestionAndAnswersScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuestionAndAnswersScreen()
    }
}
