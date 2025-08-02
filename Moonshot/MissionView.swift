
import SwiftUI

struct MissionView: View {
   
    let mission: Mission
    let crew: [CrewMember]
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 10)
                    .shadow(color: Color.white.opacity(0.2), radius: 60, x: 0, y: 0)

                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.5
                    }
                    .padding(.top)
                Spacer()
                Spacer()
                Text(mission.formattedLauncDate)
                    .font(.headline)
                VStack(alignment: .leading) {
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.white.opacity(0.1))
                        .padding(.vertical)
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.8))
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.white.opacity(0.1))
                        .padding(.vertical)
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                CrewScrollView(mission: mission, crew: crew)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}


#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
