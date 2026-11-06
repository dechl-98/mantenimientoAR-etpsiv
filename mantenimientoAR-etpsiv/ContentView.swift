import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = EquipoViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.equipos)
                {
                    equipo in NavigationLink(equipo.nombre){
                        EquipoView(equipo: equipo)
                    }
                }
            }
            .padding()
            .navigationTitle("Inicio")
            .task {
                await viewModel.cargarEquipos()
            }
        }
    }
}

#Preview {
    ContentView()
}
