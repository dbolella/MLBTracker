import SwiftUI

struct ScoutView: View {
    struct Subpage: Identifiable, Hashable {
        let id = UUID()
        let title: String
        let icon: String
    }

    let subpages: [Subpage] = [
        .init(title: "Players", icon: "person.3.fill"),
        .init(title: "Stadiums", icon: "building.2.fill"),
        .init(title: "Stats Leaders", icon: "chart.bar.fill"),
        .init(title: "Prospects", icon: "star.circle.fill"),
        .init(title: "History", icon: "book.fill")
    ]

    var body: some View {
        NavigationStack {
            List(subpages) { subpage in
                NavigationLink(destination: SampleDetailView(title: subpage.title)) {
                    Label(subpage.title, systemImage: subpage.icon)
                }
            }
            .navigationTitle("Scout")
        }
    }
}

struct SampleDetailView: View {
    let title: String
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "magnifyingglass")
                .font(.largeTitle)
                .padding()
            Text("Sample page for \(title)")
                .font(.title2)
                .padding()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ScoutView()
}
