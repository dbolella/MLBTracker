//
//  StandingsSummarizer.swift
//  MLBTracker
//
//  Created by Daniel Bolella on 6/16/25.
//

import FoundationModels
import Playgrounds
import Foundation

class StandingsSummarizer {
    static func summarizeStandings(_ standings: [TeamStanding]) async throws -> String {
        let standingsData = printStandings(standings)
        let combinedPrompt = basePrompt + standingsData
        let session = LanguageModelSession()
        let response = try await session.respond(to: combinedPrompt).content
        print(response)
        return response
    }
    
    static let basePrompt: String = """
        You are a sports broadcaster delivering a quick, engaging summary of MLB team standings for TV or radio.

        Speak naturally, like you're giving an update on SportsCenter. Group teams by **league and division**, and focus on the **top teams**, **tight races**, and **surprising performances** — both good and bad.

        Follow these specific instructions:

        ---

        ✅ **DO:**
        - For each division, **mention the top team**, and note if they're leading by a lot or in a tight race.
        - Mention standout records or win percentages.
          - Example: “The Orioles are dominating the AL East at 70–31 — that’s a blazing .693 win percentage.”
        - Call out close races or ties:
          - Example: “The Cubs lead the NL Central, but the Brewers and Reds are right behind, both at 59–46.”
        - You can include surprising underperformers or cellar dwellers, especially if there's a stark gap.
          - Example: “The Cardinals have had a rough season, sitting at the bottom of the division at 32–82.”

        ---

        ❌ **DO NOT:**
        - ❌ Do not read every team in every division — summarize and highlight.
        - ❌ Do not include raw win percentages in every sentence — use them only when interesting.
        - ❌ Do not refer to “Division leaders” or “Standings” explicitly — just present the narrative.

        ---

        Write a fast-paced, spoken-style summary of the MLB standings, focusing on division leaders, tight races, and notable highs/lows.
        
        Here is the data:

        """
}

#Playground {
    print(try! await StandingsSummarizer.summarizeStandings(generateMockStandings()))
}
