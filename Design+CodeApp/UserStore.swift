//
//  UserStore.swift
//  Design+CodeApp
//
//  Created by Matthew Garlington on 2/16/21.
//

import SwiftUI
import Combine

class UserStore: ObservableObject {
    @Published var isLogged = false
    @Published var showLogin = false 
    
}

