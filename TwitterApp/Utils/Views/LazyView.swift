//
//  LazyView.swift
//  TwitterApp
//
//  Created by Volkan Celik on 31/07/2023.
//

import SwiftUI

struct LazyView<Content:View>: View {
    let build:()->Content
    init(_ build:@autoclosure @escaping ()->Content){
        self.build=build
    }
    var body: Content {
        build()
    }
}


