//
//  PostList.swift
//  Design+CodeApp
//
//  Created by Matthew Garlington on 2/14/21.
//

import SwiftUI

struct PostList: View {
    
    @State var posts: [Post] = []
 
    
    var body: some View {
        // Adding the list with a number of items that the API gives us
        List(posts) { post in
            Text(post.title)
      
            }
        
        .onAppear {
            
            // Adding the posts array and the State var allows us to manipulate the data given to us from the API

            Api().getPosts { (posts) in
                
                // Adding the posts to the State posts
                self.posts = posts
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
