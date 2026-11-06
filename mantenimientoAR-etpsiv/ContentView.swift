import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = EquipoViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Group {
                    if let mensaje = viewModel.mensajeError {
                        ContentUnavailableView("No se pudo cargar", systemImage: "exclamationmark.triangle", description: Text(mensaje))
                    } else if viewModel.estaCargando{
                        ProgressView("Cargando equipos...")
                    } else {
                        List(viewModel.equipos) {
                            equipo in NavigationLink(equipo.nombre){
                                EquipoView(equipo: equipo)
                            }
                        }
                    }
                }
                .padding()
                .navigationTitle("Inicio")
            }
            .task {
                await viewModel.cargarEquipos()
            }
        }
    }
}

#Preview {
    ContentView()
}
