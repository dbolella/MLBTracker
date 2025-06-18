//
//  BaseballGame.swift
//  MLBTracker
//
//  Created by Daniel Bolella on 6/12/25.
//
import Foundation

struct BaseballGame: Identifiable {
    let id = UUID()
    let homeTeam: MLBTeam
    let awayTeam: MLBTeam
    let homeScore: Int
    let awayScore: Int
    let inningsPlayed: Int
    let isGameOver: Bool
    let teamAtBat: MLBTeam
}

func generateMockGames() -> [BaseballGame] {
    var games: [BaseballGame] = []
    let teams = MLBTeam.allCases.shuffled()
    
    for i in stride(from: 0, to: teams.count, by: 2) {
        if i + 1 < teams.count {
            let home = teams[i]
            let away = teams[i + 1]
            let innings = Int.random(in: 7...9)
            let homeScore = Int.random(in: 0...10)
            let awayScore = Int.random(in: 0...10)
            let gameOver = Bool.random()
            let currentTeam = Bool.random() ? home : away
            
            games.append(BaseballGame(
                homeTeam: home,
                awayTeam: away,
                homeScore: homeScore,
                awayScore: awayScore,
                inningsPlayed: innings,
                isGameOver: gameOver,
                teamAtBat: currentTeam
            ))
        }
    }
    
    return games
}

func printBaseballGamesDetails(_ games: [BaseballGame]) -> String {
    var result: String = ""
    for game in games {
        result += "Home: \(game.homeTeam), Away: \(game.awayTeam), Home Score: \(game.homeScore), Away Score: \(game.awayScore), Innings: \(game.inningsPlayed), Over: \(game.isGameOver), At Bat: \(game.teamAtBat)\n"
    }
    return result
}
