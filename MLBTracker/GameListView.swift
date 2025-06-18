//
//  GameListView.swift
//  MLBTracker
//
//  Created by Daniel Bolella on 6/12/25.
//
import SwiftUI
import FoundationModels
import AVFoundation

struct GameListView: View {
    let games = generateMockGames()

    var body: some View {
        NavigationView {
            SummaryTemplateView(
                generateSummary: { try await ScoresSummarizer.summarizeGameScores(games) },
                content: {
                    List(games) { game in
                        VStack(alignment: .leading) {
                            Text("\(game.awayTeam.abbreviation) @ \(game.homeTeam.abbreviation)")
                                .font(.headline)
                            Text("Score: \(game.awayScore) - \(game.homeScore)")
                            Text("Innings: \(game.inningsPlayed) | At Bat: \(game.teamAtBat.abbreviation)")
                            if game.isGameOver {
                                Text("FINAL")
                                    .foregroundColor(.red)
                                    .bold()
                            }
                        }
                    }
                },
                summaryIcon: Image(systemName: "baseball.fill"),
                summarySheetTitle: "Scores Summary"
            )
            .navigationTitle("MLB Scores")
        }
    }
}

#Preview {
    GameListView()
}
