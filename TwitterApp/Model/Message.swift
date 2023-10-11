//
//  Message.swift
//  TwitterApp
//
//  Created by Volkan Celik on 19/07/2023.
//

import SwiftUI
import Firebase


struct Message:Identifiable{
    let text:String
    let user:User
    let toId:String
    let fromId:String
    let isFromCurrentUser:Bool
    let timestamp:Timestamp
    let id:String
    
    var chatPartnerId:String{
        return isFromCurrentUser ? toId : fromId
    }
    
    init(user:User,dictionary:[String:Any]){
        self.user=user
        self.text=dictionary["text"] as? String ?? ""
        self.toId=dictionary["toId"] as? String ?? ""
        self.fromId=dictionary["fromId"] as? String ?? ""
        self.isFromCurrentUser=Auth.auth().currentUser?.uid == fromId
        self.timestamp=dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.id=dictionary["id"] as? String ?? ""
    }
}

struct MockMessage:Identifiable{
    let id:Int
    let imageName:String
    let messageText:String
    let isCurrentUser:Bool
}

let MOCK_MESSAGES:[MockMessage]=[
    MockMessage(id: 0, imageName: "spiderman", messageText: "Hey whats up?", isCurrentUser: false),
    MockMessage(id: 1, imageName: "batman", messageText: "Not much, you?", isCurrentUser: true),
    MockMessage(id: 2, imageName: "batman", messageText: "How is the Marvel Universe?", isCurrentUser: true),
    MockMessage(id: 3, imageName: "spiderman", messageText: "Its pretty good dude", isCurrentUser: false),
    MockMessage(id: 4, imageName: "spiderman", messageText: "How is your battle with the Joker?", isCurrentUser: false),
    MockMessage(id: 5, imageName: "batman", messageText: "Not going so hot...", isCurrentUser: true)
]
