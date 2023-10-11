//
//  NewMessageView.swift
//  TwitterApp
//
//  Created by Volkan Celik on 19/07/2023.
//

import SwiftUI

struct NewMessageView: View {
    
    @State var searchText=""
    @Binding var show:Bool
    @Binding var startChat:Bool
    @Binding var user:User?
    @ObservedObject var viewModel=SearchViewModel(config: .newMessage)
    
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            VStack{
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)){user in
                    HStack{
                        Button {
                            show.toggle()
                            startChat.toggle()
                            self.user=user
                        } label: {
                            UserCell(user: user)
                        }

                        Spacer()
                    }
                }
            }
            .padding(.leading)
        }

    }
}


