//
//  MLBTeam.swift
//  MLBTracker
//
//  Created by Daniel Bolella on 6/12/25.
//


enum MLBTeam: String, CaseIterable, Identifiable {
    var id: String { abbreviation }

    case yankees = "New York Yankees"
    case redSox = "Boston Red Sox"
    case dodgers = "Los Angeles Dodgers"
    case giants = "San Francisco Giants"
    case cubs = "Chicago Cubs"
    case whiteSox = "Chicago White Sox"
    case mets = "New York Mets"
    case braves = "Atlanta Braves"
    case cardinals = "St. Louis Cardinals"
    case phillies = "Philadelphia Phillies"
    case astros = "Houston Astros"
    case padres = "San Diego Padres"
    case rays = "Tampa Bay Rays"
    case blueJays = "Toronto Blue Jays"
    case orioles = "Baltimore Orioles"
    case tigers = "Detroit Tigers"
    case guardians = "Cleveland Guardians"
    case twins = "Minnesota Twins"
    case royals = "Kansas City Royals"
    case mariners = "Seattle Mariners"
    case athletics = "Oakland Athletics"
    case rangers = "Texas Rangers"
    case angels = "Los Angeles Angels"
    case diamondbacks = "Arizona Diamondbacks"
    case rockies = "Colorado Rockies"
    case marlins = "Miami Marlins"
    case brewers = "Milwaukee Brewers"
    case reds = "Cincinnati Reds"
    case nationals = "Washington Nationals"
    case pirates = "Pittsburgh Pirates"

    var abbreviation: String {
        switch self {
        case .yankees: return "NYY"
        case .redSox: return "BOS"
        case .dodgers: return "LAD"
        case .giants: return "SF"
        case .cubs: return "CHC"
        case .whiteSox: return "CWS"
        case .mets: return "NYM"
        case .braves: return "ATL"
        case .cardinals: return "STL"
        case .phillies: return "PHI"
        case .astros: return "HOU"
        case .padres: return "SD"
        case .rays: return "TB"
        case .blueJays: return "TOR"
        case .orioles: return "BAL"
        case .tigers: return "DET"
        case .guardians: return "CLE"
        case .twins: return "MIN"
        case .royals: return "KC"
        case .mariners: return "SEA"
        case .athletics: return "OAK"
        case .rangers: return "TEX"
        case .angels: return "LAA"
        case .diamondbacks: return "ARI"
        case .rockies: return "COL"
        case .marlins: return "MIA"
        case .brewers: return "MIL"
        case .reds: return "CIN"
        case .nationals: return "WSH"
        case .pirates: return "PIT"
        }
    }
}
