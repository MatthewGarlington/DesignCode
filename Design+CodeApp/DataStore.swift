//
//  DataStore.swift
//  Design+CodeApp
//
//  Created by Matthew Garlington on 2/14/21.
//

import SwiftUI
import Combine


class DataStore: ObservableObject {
    
    @Published var posts: [Post] = []
    
    init() {
        getPosts()
        
    }
    
    func getPosts() {
        
        Api().getPosts { (posts) in
        self.posts = posts
            
        }
    }
}

