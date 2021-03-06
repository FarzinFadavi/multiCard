//
//  multiCardApp.swift
//  multiCard
//
//  Created by Farzin macbook on 2/7/22.
//

import SwiftUI

@main
struct multiCardApp: App {
    
    @StateObject var appModel = AppModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appModel)
        }
    }
}
