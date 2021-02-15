//
//  CourseStore.swift
//  Design+CodeApp
//
//  Created by Matthew Garlington on 2/14/21.
//

import SwiftUI
import Contentful
import Combine


let client = Client(spaceId: "jeq8io41y7m4", accessToken: "GgbVB3YT5SpC4Je6egEp9RcWs9lkPispB6XWEgEunlw")

func getArray(id: String, completion: @escaping([Entry]) -> ()) {
    
    let query = Query.where(contentTypeId: "course")
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        
        // Here Using the documentation from contentful to use a switch statement to to recieve the items array from contentful
        
        switch result {
        case .success(let array) :
            completion(array.items)
            // Repeat the completeion handler so that the data can be used througout the project
            DispatchQueue.main.async {
                completion(array.items)
            }
       
        case .failure(let error) :
            print(error)
            
        
        }
        
    }
}

class CourseStore: ObservableObject {
    
    @Published var courses: [Course] = courseData
    
    // Make the Contentful API Call
    init() {
        
        getArray(id: "course") { (items) in
            items.forEach { (item) in
                // Adding the data from the API to our courses example data 
                self.courses.append(Course(title: item.fields["title"] as! String,
                                           subtitle: item.fields["subtitle"] as! String,
                                           image: #imageLiteral(resourceName: "Background1-Dark"),
                                           logo: #imageLiteral(resourceName: "Logo1"),
                                           color: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),
                                           show: false))
                
            }
        }
        
    }
    
}
