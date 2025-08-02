
import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [
        GridItem(.adaptive(minimum: 150))
        ]
    
    var body: some View {
        NavigationStack {
            ScrollView() {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink() {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedLauncDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.8))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                      }
                    }
                    .padding([.horizontal, .bottom])
                }
                .navigationTitle("MoonShot")
                .background(.darkBackground)
                .preferredColorScheme(.dark)
                .shadow(color: Color.white.opacity(0.1), radius: 60, x: 0, y: 0)
            }
        }
    }

#Preview {
    ContentView()
}
