//
//  League.swift
//  MLBTracker
//
//  Created by Daniel Bolella on 6/12/25.
//


enum League: String, CaseIterable {
    case american = "American League"
    case national = "National League"
}

enum Division: String, CaseIterable {
    case east = "East"
    case central = "Central"
    case west = "West"
}

extension MLBTeam {
    var league: League {
        switch self {
        case .yankees, .redSox, .blueJays, .orioles, .rays,
             .guardians, .twins, .whiteSox, .tigers, .royals,
             .astros, .rangers, .mariners, .angels, .athletics:
            return .american
        default:
            return .national
        }
    }

    var division: Division {
        switch self {
        case .yankees, .redSox, .blueJays, .orioles, .rays,
             .mets, .braves, .phillies, .nationals, .marlins:
            return .east
        case .guardians, .twins, .whiteSox, .tigers, .royals,
             .cardinals, .cubs, .reds, .pirates, .brewers:
            return .central
        default:
            return .west
        }
    }
}
