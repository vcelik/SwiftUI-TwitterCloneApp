//
//  UploadTweetViewModel.swift
//  TwitterApp
//
//  Created by Volkan Celik on 31/07/2023.
//

import SwiftUI
import Firebase

class UploadTweetViewModel:ObservableObject{
    
    @Binding var isPresented:Bool
    
    init(isPresented:Binding<Bool>){
        self._isPresented=isPresented
    }
    
    func uploadTweet(caption:String){
        guard let user=AuthViewModel.shared.user else{return}
        
        let docRef=COLLECTION_TWEETS.document()
        
        let data:[String:Any]=[
            "uid":user.id,
            "caption":caption,
            "fullname":user.fullname,
            "timestamp":Timestamp(date: Date()),
            "username":user.username,
            "profileImageUrl":user.profileImageUrl,
            "likes":0,
            "id":docRef.documentID
        ]
        
        docRef.setData(data){_ in
            print("Successfully uploaded tweet")
            self.isPresented=false
        }
        
    }
}
