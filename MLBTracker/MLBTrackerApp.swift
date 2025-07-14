//
//  MLBTrackerApp.swift
//  MLBTracker
//
//  Created by Daniel Bolella on 6/12/25.
//

import SwiftUI

@main
struct MLBTrackerApp: App {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    var body: some Scene {
        WindowGroup {
            if horizontalSizeClass == .compact {
                ContentView()
            } else {
                ViewThatFits {
                    ContentView()
                        .frame(minWidth: 320, maxWidth: .infinity, minHeight: 568, maxHeight: .infinity)
                    
                    Text("Please resize the window")
                        .font(.headline)
                }
            }
        }
    }
}
