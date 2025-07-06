import SwiftUI

struct GameDetailSheetView: View {
    var body: some View {
        VStack(spacing: 32) {
            // Score row
            HStack(alignment: .firstTextBaseline, spacing: 24) {
                Text("NYY")
                    .font(.system(size: 42, weight: .bold, design: .rounded))
                Text("4 - 3")
                    .font(.system(size: 42, weight: .bold, design: .rounded))
                Text("BOS")
                    .font(.system(size: 42, weight: .bold, design: .rounded))
            }

            // Outs, Strikes/Balls, Inning
            HStack(alignment: .top) {
                // Outs
                VStack(spacing: 8) {
                    Text("OUTS")
                        .font(.headline)
                    HStack(spacing: 6) {
                        Circle()
                            .frame(width: 13, height: 13)
                            .foregroundColor(.primary)
                        Circle()
                            .frame(width: 13, height: 13)
                            .foregroundColor(.primary.opacity(0.1))
                        Circle()
                            .frame(width: 13, height: 13)
                            .foregroundColor(.primary.opacity(0.1))
                    }
                }
                .frame(maxWidth: .infinity)
                // Strikes/Balls
                VStack(spacing: 8) {
                    Text("BALLS/STRIKES")
                        .font(.headline)
                    Text("3/2")
                        .font(.title2)
                        .bold()
                }
                .frame(maxWidth: .infinity)
                // Inning
                VStack(spacing: 8) {
                    Text("INNING")
                        .font(.headline)
                    HStack(spacing: 4) {
                        Text("7")
                            .font(.title2)
                            .bold()
                        Image(systemName: "arrow.up")
                            .font(.caption)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.top, 8)

            // Diamond graphic (simple)
            ZStack {
                DiamondShape()
                    .stroke(Color.primary, lineWidth: 2)
                    .frame(width: 160, height: 160)
                // Bases
                ForEach(0..<4) { base in
                    BaseShape()
                        .fill(base == 3 ? Color.red : Color.white)
                        .overlay(BaseShape().stroke(Color.primary, lineWidth: 2))
                        .frame(width: 24, height: 24)
                        .offset(diamondBaseOffset(base: base, size: 80))
                }
                // Pitcher's mound
                Circle()
                    .stroke(Color.primary, lineWidth: 2)
                    .frame(width: 32, height: 32)
            }
            .frame(height: 170)

            // Game Summary
            VStack(alignment: .leading, spacing: 6) {
                Text("GAME SUMMARY")
                    .font(.headline)
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.12))
                    .frame(height: 50)
                    .overlay(
                        Text("Yankees lead after a late home run. Red Sox up to bat in the 7th.")
                            .font(.callout)
                            .padding(.horizontal, 8)
                            .foregroundColor(.primary)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                    )
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 12)
        }
        .padding(28)
        .presentationDetents([.medium, .large])
    }

    // Calculate the offset for each base for a diamond layout
    func diamondBaseOffset(base: Int, size: CGFloat) -> CGSize {
        let radius = size
        let angle = Angle.degrees(Double(base) * 90 - 45)
        let x = CGFloat(cos(angle.radians)) * radius
        let y = CGFloat(sin(angle.radians)) * radius
        return CGSize(width: x, height: y)
    }
}

struct DiamondShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let r = min(rect.width, rect.height) / 2
        for i in 0..<4 {
            let angle = Double(i) * .pi / 2 - .pi/4
            let point = CGPoint(
                x: center.x + Darwin.cos(angle) * r,
                y: center.y + Darwin.sin(angle) * r
            )
            if i == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        path.closeSubpath()
        return path
    }
}

struct BaseShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let r = min(rect.width, rect.height) / 2
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    GameDetailSheetView()
}
