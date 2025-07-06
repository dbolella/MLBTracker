//
//  ScoresSummarizer.swift
//  MLBTracker
//
//  Created by Daniel Bolella on 6/16/25.
//

import FoundationModels
import Playgrounds

actor ScoresSummarizer {
    static func summarizeGameScores(_ games: [BaseballGame]) async throws -> String {
        let gameData = await printBaseballGamesDetails(games)
        let combinedPrompt = basePrompt + gameData
        let session = LanguageModelSession()
        let response = try await session.respond(to: combinedPrompt).content
        print(response)
        return response
    }
    
    static let basePrompt: String = """
        You're a sports broadcaster writing a quick, energetic baseball update for TV — just like a SportsCenter highlight reel.

        Use natural, spoken-style English that flows well when read aloud. For each game, follow these exact rules:

        - If a game is **final** (over is true), include the final score. Example: “Final in Houston — Astros win it 10 to 3 over the Marlins.”
        - If the game is **in progress** (over is false), say what inning it is and whether it’s the **top** or **bottom**. Example: “Bottom of the 8th in St. Louis — Cardinals holding a 4–3 lead on the Phillies.”
        - DO NOT say who is at bat.
        - DO NOT say “home team” or “away team”. Just use the team names directly.
        - DO NOT mention the inning number alone — always say “top” or “bottom” of the inning.
        - Keep each summary snappy and smooth, like it would sound on TV.
        - Separate each game with a short phrase like: “Meanwhile”, “Over in...”, “Also tonight”, etc.
        
        Generate a spoken-style summary for all of the following games:
        
        """
}

#Playground {
    print(printBaseballGamesDetails(generateMockGames()))
}

#Playground {
    print(try! await ScoresSummarizer.summarizeGameScores(generateMockGames()))
}
