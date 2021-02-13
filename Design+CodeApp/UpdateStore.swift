//
//  UpdateStore.swift
//  Design+CodeApp
//
//  Created by Matthew Garlington on 2/12/21.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    
    @Published var updates: [Update] = updateData
    
}
