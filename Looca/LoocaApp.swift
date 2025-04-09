//
//  LoocaApp.swift
//  Looca
//
//  Created by FWZ on 25/03/25.
//

import SwiftUI

@main
struct LoocaApp: App {
    
    @AppStorage("firstLaunch") var firstLaunch = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
