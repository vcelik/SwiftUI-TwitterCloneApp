//
//  ProfileViewModel.swift
//  TwitterApp
//
//  Created by Volkan Celik on 29/07/2023.
//

import SwiftUI
import Firebase

class ProfileViewModel:ObservableObject{
    @Published var user:User
    @Published var userTweets=[Tweet]()
    @Published var likedTweets=[Tweet]()
    
    init(user:User){
        self.user=user
        checkIfUserIsFollowed()
        fetchUserTweets()
        fetchLikedTweets()
        fetchUserStats()
       // print("Profile ViewModel")
    }
    

    

    
    func tweets(forFilter filter:TweetFilterOptions)->[Tweet]{
        switch filter{
        case .tweets:return userTweets
        case .likes:return likedTweets
        }
    }
}

//MARK:-API
extension ProfileViewModel{
    func follow(){
        guard let currentUid=Auth.auth().currentUser?.uid else {return}
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(user.id).setData([:]){_ in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers").document(currentUid).setData([:]){_ in
                self.user.isFollowed=true
            }
        }
    }
    
    func unfollow(){
        guard let currentUid=Auth.auth().currentUser?.uid else {return}
        let followingRef=COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        let followersRef=COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        
        followingRef.document(user.id).delete{_ in
            followersRef.document(currentUid).delete{_ in
                self.user.isFollowed=false
            }
        }
    }
    
    func checkIfUserIsFollowed(){
        guard let currentUid=Auth.auth().currentUser?.uid else {return}
        guard !user.isCurrentUser else {return}
        let followingRef=COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        
        followingRef.document(user.id).getDocument { snapshot, _ in
            guard let isFollowed=snapshot?.exists else {return}
            self.user.isFollowed=isFollowed
        }
    }
    
    func fetchUserTweets(){
        COLLECTION_TWEETS.whereField("uid", isEqualTo: user.id).getDocuments { snapshot, _ in
            guard let documents=snapshot?.documents else {return}
            self.userTweets=documents.map({Tweet(dictionary: $0.data())})
            print("User tweets:\(self.userTweets)")
        }
    }
    
    func fetchLikedTweets(){
        var tweets=[Tweet]()
        COLLECTION_USERS.document(user.id).collection("user-likes").getDocuments { snapshot, _ in
            guard let documents=snapshot?.documents else {return}
            let tweetIds=documents.map({$0.documentID})
            tweetIds.forEach{id in
                COLLECTION_TWEETS.document(id).getDocument { snapshot, _ in
                    guard let data=snapshot?.data() else {return}
                    let tweet=Tweet(dictionary: data)
                    tweets.append(tweet)
                    guard tweets.count == tweetIds.count else {return}
                    self.likedTweets=tweets
                }
                
            }
            
        }
    }
    
    func fetchUserStats(){
        let followersRef=COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        let followingRef=COLLECTION_FOLLOWING.document(user.id).collection("user-following")
        
        followersRef.getDocuments { snapshot, _ in
            guard let followerCount=snapshot?.documents.count else {return}
            followingRef.getDocuments { snapshot, _ in
                guard let followingCount=snapshot?.documents.count else {return}
                self.user.stats=UserStats(followers: followerCount, following: followingCount)
            }
        }
    }
}
