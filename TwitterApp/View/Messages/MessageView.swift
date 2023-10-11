//
//  MessageView.swift
//  TwitterApp
//
//  Created by Volkan Celik on 19/07/2023.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
    let message:Message
    var body: some View {
        HStack{
            if message.isFromCurrentUser{
                Spacer()
                Text(message.text)
                    .padding()
                    .background(Color.blue)
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.leading,100)
                    .padding(.trailing,16)
            }else{
                HStack(alignment:.bottom){
                    KFImage(URL(string: message.user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width:40,height:40)
                        .clipShape(Circle())
                    Text(message.text)
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}



