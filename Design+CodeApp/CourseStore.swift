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
            //completion(array.items)
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
    
    @Published var courses: [Course] = []
    
    // Make the Contentful API Call
    init() {
        // Add color literal array to randomize colors
        let colors = [#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) ]
        var index = 0
        
        getArray(id: "course") { (items) in
            items.forEach { (item) in
                // Adding the data from the API to our courses example data 
                self.courses.append(Course(title: item.fields["title"] as! String,
                                           subtitle: item.fields["subtitle"] as! String,
                                           // Gives the ability to use SDWebImageSwiftUI to process a URL String
                                           image: item.fields.linkedAsset(at: "image")?.url ?? URL(string: "https://dl.dropbox.com/s/9vvklb94vpaafxw/Card3%402x.png?dl=0")!,
                                           logo: #imageLiteral(resourceName: "Logo1"),
                                           // add array of colors from above to color and set to the index
                                           color: colors[index],
                                           show: false))
                
               index = index + 1
                
            }
        }
        
    }
    
}
