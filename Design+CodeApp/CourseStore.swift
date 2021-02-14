//
//  CourseStore.swift
//  Design+CodeApp
//
//  Created by Matthew Garlington on 2/14/21.
//

import SwiftUI
import Contentful


let client = Client(spaceId: "jeq8io41y7m4", accessToken: "GgbVB3YT5SpC4Je6egEp9RcWs9lkPispB6XWEgEunlw")

func getArray() {
    
    let query = Query.where(contentTypeId: "course")
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        
        print(result)
        
        
        
        
        
    }
    
    
}
