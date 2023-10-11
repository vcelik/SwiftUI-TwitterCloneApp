//
//  MessageInputView.swift
//  TwitterApp
//
//  Created by Volkan Celik on 19/07/2023.
//

import SwiftUI

struct MessageInputView: View {
    
    @Binding var messageText:String
   // let viewModel:ChatViewModel
    var action:()->Void
    
    var body: some View {
        HStack{
            TextField("Message...", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight:30)
            Button {
                action()
            } label: {
                Text("Send")
            }

        }
    }
}


