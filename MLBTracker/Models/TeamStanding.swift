//
//  TeamStanding.swift
//  MLBTracker
//
//  Created by Daniel Bolella on 6/12/25.
//
import Foundation

struct TeamStanding: Identifiable {
    let id = UUID()
    let team: MLBTeam
    let league: League
    let division: Division
    let wins: Int
    let losses: Int
    
    var winPercentage: Double {
        let totalGames = wins + losses
        return totalGames > 0 ? Double(wins) / Double(totalGames) : 0.0
    }
}

func generateMockStandings() -> [TeamStanding] {
    MLBTeam.allCases.map { team in
        let wins = Int.random(in: 30...90)
        let losses = Int.random(in: 30...90)
        return TeamStanding(
            team: team,
            league: team.league,
            division: team.division,
            wins: wins,
            losses: losses
        )
    }
}

func printStandings(_ standings: [TeamStanding]) -> String {
    var standingsString = ""
    for league in League.allCases {
        standingsString += "\(league.rawValue):\n"
        for division in Division.allCases {
            standingsString += "  \(division.rawValue) Division:\n"
            let teams = standings.filter { $0.league == league && $0.division == division }
            for team in teams.sorted(by: { $0.winPercentage > $1.winPercentage }) {
                standingsString += "    \(team.team): \(team.wins)-\(team.losses) (Win%: \(String(format: "%.3f", team.winPercentage)))\n"
            }
        }
    }
    return standingsString
}
