//
//  Design_CodeAppApp.swift
//  Design+CodeApp
//
//  Created by Matthew Garlington on 2/12/21.
//

import SwiftUI
import Firebase



class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    print("Colors application is starting up. ApplicationDelegate didFinishLaunchingWithOptions.")
    return true
  }
}


@main

struct Design_CodeAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
      FirebaseApp.configure()
    }
   
    var body: some Scene {
        WindowGroup {
            LoginView()
            
        }
    }
}
