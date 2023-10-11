//
//  SearchView.swift
//  TwitterApp
//
//  Created by Volkan Celik on 19/07/2023.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText=""
    @ObservedObject var viewModel=SearchViewModel(config: .search)
    
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            VStack{
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)){user in
                    HStack{
                        NavigationLink {
                            LazyView(UserProfileView(user: user))
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
