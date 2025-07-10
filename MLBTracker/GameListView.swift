//
//  GameListView.swift
//  MLBTracker
//
//  Created by Daniel Bolella on 6/12/25.
//
import SwiftUI

struct GameListView: View {
    let games = generateMockGames()

    var body: some View {
        ViewThatFits {
            NavigationSplitView {
                SummaryTemplateView(
                    generateSummary: { try await ScoresSummarizer.summarizeGameScores(games) },
                    content: {
                        List(games) { game in
                            GameRow(game)
                        }
                    },
                    summaryIcon: Image(systemName: "baseball.fill"),
                    summarySheetTitle: "Scores Summary"
                )
                .navigationTitle("MLB Scores")
            } detail: {
                GameDetailSheetView()
            }
            
            NavigationStack {
                SummaryTemplateView(
                    generateSummary: { try await ScoresSummarizer.summarizeGameScores(games) },
                    content: {
                        List(games) { game in
                            GameRow(game)
                        }
                    },
                    summaryIcon: Image(systemName: "baseball.fill"),
                    summarySheetTitle: "Scores Summary"
                )
                .navigationTitle("MLB Scores")
            }
        }
    }
    
    func GameRow(_ game: BaseballGame) -> some View {
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
}

#Preview {
    GameListView()
}
