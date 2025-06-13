//
//  ContentView.swift
//  MLBTracker
//
//  Created by Daniel Bolella on 6/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Scores", systemImage: "baseball.diamond.bases") {
                GameListView()
            }
            
            Tab("Standings", systemImage: "figure.baseball") {
                StandingsView()
            }
        }
        .tabViewBottomAccessory {
            HStack {
                Image(systemName: "baseball.diamond.bases.outs.indicator")
                Text("\(MLBTeam.yankees.abbreviation) 4 - 3 \(MLBTeam.redSox.abbreviation)")
                    .bold()
                Image(systemName: "arrow.up")
                    .font(.caption)
                Text("7")
            }
        }
        .tabBarMinimizeBehavior(.onScrollDown)
    }
}

#Preview {
    ContentView()
}
