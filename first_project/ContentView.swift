
import SwiftUI


struct ContentView: View {
    let astronaut : [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var body : some View{
        VStack{
            Text(String(astronaut.count))
            Text(String(missions.count))
        }
    }
    
}
#Preview {
    ContentView()
}
