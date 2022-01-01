//
//  ProgressBar.swift
//  Sarrafi
//
//  Created by armin on 7/14/21.
//

import SwiftUI

struct ProgressBar: View {
    @State var progress: Float
    @State var title: String
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5.0)
                .foregroundColor(Color("BackgroundColor"))
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(abs(self.progress) > 0.01 ? abs(self.progress) : 0.01 , 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(calculateColor(progress: progress))
                .rotationEffect(Angle(degrees: 270.0))

            Text(title)
                .customFont(name: "Shabnam", style: .caption1, weight: .medium)
                .padding(.all, 15)
        }
    }
}

extension ProgressBar {
    private func calculateColor(progress: Float) -> Color {
        if progress < 0 {
            return Color.red
        } else {
            return Color.green
        }
    }
}
