//
//  StandingsView.swift
//  MLBTracker
//
//  Created by Daniel Bolella on 6/12/25.
//
import SwiftUI

struct StandingsView: View {
    let standings: [TeamStanding] = generateMockStandings()

    var body: some View {
        ViewThatFits {
            NavigationSplitView {
                SummaryTemplateView(
                    generateSummary: { try await StandingsSummarizer.summarizeStandings(standings) },
                    content: {
                        List {
                            StandingsSections()
                        }
                    },
                    summaryIcon: Image(systemName: "baseball.fill"),
                    summarySheetTitle: "Standings Summary"
                )
                .navigationTitle("MLB Standings")
            } detail: {
                GameDetailSheetView()
            }
            
            NavigationStack {
                SummaryTemplateView(
                    generateSummary: { try await StandingsSummarizer.summarizeStandings(standings) },
                    content: {
                        List {
                            StandingsSections()
                        }
                    },
                    summaryIcon: Image(systemName: "baseball.fill"),
                    summarySheetTitle: "Standings Summary"
                )
                .navigationTitle("MLB Standings")
            }
        }
    }
    
    func StandingsSections() -> some View {
        ForEach(League.allCases, id: \.self) { league in
            if let divisions = groupedStandings[league] {
                Section(header: Text(league.rawValue).font(.title2)) {
                    ForEach(Division.allCases, id: \.self) { division in
                        if let teams = divisions[division] {
                            Section(header: Text(division.rawValue)) {
                                ForEach(teams) { team in
                                    HStack {
                                        Text(team.team.rawValue)
                                            .fontWeight(.bold)
                                        Spacer()
                                        Text("\(team.wins)-\(team.losses)")
                                        Text("(\(String(format: "%.3f", team.winPercentage)))")
                                            .foregroundColor(.gray)
                                            .font(.footnote)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    private var groupedStandings: [League: [Division: [TeamStanding]]] {
        Dictionary(grouping: standings) { $0.league }
            .mapValues { leagueStandings in
                Dictionary(grouping: leagueStandings) { $0.division }
                    .mapValues { $0.sorted { $0.winPercentage > $1.winPercentage } }
            }
    }
}

#Preview {
    StandingsView()
}
