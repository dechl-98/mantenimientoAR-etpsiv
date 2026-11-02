import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = EquipoViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "wrench.and.screwdriver")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Mantenimiento AR - Base de Proyecto")
                    .font(.title2)
                    .padding(.top)
            }
            .padding()
            .navigationTitle("Inicio")
        }
    }
}

#Preview {
    ContentView()
}
