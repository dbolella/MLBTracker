//
//  ContentView.swift
//  MLBTracker
//
//  Created by Daniel Bolella on 6/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showGameSheet = false
    @State private var searchText: String = ""

    var body: some View {
        TabView {
            Tab("Scores", systemImage: "baseball.diamond.bases") {
                GameListView()
            }
            
            Tab("Standings", systemImage: "figure.baseball") {
                StandingsView()
            }
            
            Tab("Scout", systemImage: "magnifyingglass", role: .search) {
                ScoutView()
            }
        }
        .searchable(text: $searchText)
        .tabViewBottomAccessory {
            Button(action: { showGameSheet = true }) {
                HStack {
                    Image(systemName: "baseball.diamond.bases.outs.indicator")
                    Text("\(MLBTeam.yankees.abbreviation) 4 - 3 \(MLBTeam.redSox.abbreviation)")
                        .bold()
                    Image(systemName: "arrow.up")
                        .font(.caption)
                    Text("7")
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
        }
        .sheet(isPresented: $showGameSheet) {
            GameDetailSheetView()
        }
        .tabBarMinimizeBehavior(.onScrollDown)
    }
}

#Preview {
    ContentView()
}
