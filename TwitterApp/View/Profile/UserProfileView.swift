//
//  UserProfileView.swift
//  TwitterApp
//
//  Created by Volkan Celik on 20/07/2023.
//

import SwiftUI

struct UserProfileView: View {
    
    @State var selectedFilter:TweetFilterOptions = .tweets
    @ObservedObject var viewModel:ProfileViewModel
    
    let user:User
    
    init(user:User){
        self.user=user
        self.viewModel=ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView{
            VStack{
                ProfileHeaderView(viewModel: viewModel)
                    .padding()
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(viewModel.tweets(forFilter:selectedFilter)){tweet in
                    TweetCell(tweet: tweet)
                }
            }
            .navigationTitle(user.username)
        }
    }
}


