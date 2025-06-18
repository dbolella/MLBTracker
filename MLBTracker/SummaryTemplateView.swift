import SwiftUI
import AVFoundation

struct SummaryTemplateView<Content: View>: View {
    let generateSummary: () async throws -> String
    let content: () -> Content
    let summaryIcon: Image
    let summarySheetTitle: String
    
    @State private var summaryReady = false
    @State private var generatedSummary: String?
    @State private var showSheet = false
    
    var body: some View {
        ZStack {
            content()
                .task {
                    do {
                        generatedSummary = try await generateSummary()
                        summaryReady = true
                    } catch {
                        // Handle error if needed
                    }
                }
                .toolbar {
                    if summaryReady {
                        Button {
                            showSheet.toggle()
                        } label: {
                            summaryIcon
                                .symbolEffect(.bounce, options: .speed(0.5).repeat(.continuous))
                        }
                    }
                }
                .sheet(isPresented: $showSheet) {
                    summarySheet
                }
        }
    }
    
    @ViewBuilder
    private var summarySheet: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(summarySheetTitle)
                .font(.title2)
                .bold()
                .padding(.bottom, 8)
            
            if let summary = generatedSummary {
                if let attributed = try? AttributedString(markdown: summary) {
                    Text(attributed)
                        .font(.system(.body, design: .default))
                        .padding()
                } else {
                    Text(summary)
                        .padding()
                }
            }
            Spacer()
            Button {
                readSummary()
            } label: {
                Text("Read Summary Aloud")
            }
            .buttonStyle(.glass)
            .tint(.pink)
            .padding(.bottom)
        }
        .padding()
    }
    
    private func readSummary() {
        guard let summary = generatedSummary else { return }
        let utterance = AVSpeechUtterance(string: summary)
        utterance.rate = 0.57
        utterance.pitchMultiplier = 0.8
        utterance.postUtteranceDelay = 0.2
        utterance.volume = 0.8
        let voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.voice = voice
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}
