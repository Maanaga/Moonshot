//
//  AstronautView.swift
//  Moonshot
//
//  Created by Luka Managadze on 8/1/25.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding()
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.white.opacity(0.1))
                    .padding()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .shadow(color: Color.white.opacity(0.1), radius: 60, x: 0, y: 0)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return AstronautView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
}
