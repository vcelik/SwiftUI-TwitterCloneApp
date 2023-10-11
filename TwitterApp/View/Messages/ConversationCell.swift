//
//  ConversationCell.swift
//  TwitterApp
//
//  Created by Volkan Celik on 19/07/2023.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    let message:Message
    var body: some View {
        VStack {
            HStack(spacing:12){
                KFImage(URL(string: message.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width:56,height:56)
                    .cornerRadius(28)
                VStack(alignment:.leading,spacing:4){
                    Text(message.user.fullname)
                        .font(.system(size: 14,weight: .semibold))
                    Text(message.text)
                        .font(.system(size: 15))
                        .lineLimit(2)
                }
                .foregroundColor(.black)
                .padding(.trailing)
            }
            Divider()
        }

    }
}


