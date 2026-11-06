//
//  MantenimientoView.swift
//  mantenimientoAR-etpsiv
//
//  Created by mac on 6/11/26.
//

import SwiftUI

struct PasoGuiado: Identifiable {
    let id: String
    let pieza: Pieza
    let instruccion: Instruccion
}

struct MantenimientoView: View {
    
    let equipo: Equipo
    @State private var indice = 0
    @Environment(\.dismiss) private var dismiss
    
    private var pasos: [PasoGuiado] {
        equipo.piezas
            .sorted {$0.ordenVisualizacion < $1.ordenVisualizacion}
            .flatMap { pieza in
                pieza.instrucciones
                    .sorted { $0.orden < $1.orden}
                    .map {PasoGuiado(id: $0.id, pieza: pieza, instruccion: $0)}
            }
    }
    
    private var pasoActual: PasoGuiado? {
        pasos.indices.contains(indice) ? pasos[indice] : nil
    }
    
    var body: some View {
        Group {
            if let paso = pasoActual {
                VStack(spacing: 12) {
                    ModeloView(entidadResaltada: paso.pieza.nombreEntidad)
                        .id(paso.pieza.nombreEntidad)
                        .frame(height: 250)
                    
                    Text("Paso \(indice + 1) de \(pasos.count) - \(paso.pieza.nombre)")
                        .font(.caption)
                    Text(paso.instruccion.titulo)
                        .font(.headline)
                    Text(paso.instruccion.descripcion)
                    
                    if let aviso = paso.instruccion.advertenciaSeguridad {
                        Label(aviso, systemImage: "exclamationmark.triangle")
                            .foregroundStyle(.orange)
                    }
                    Spacer()
                    
                    HStack {
                        Button("Anterior") { indice -= 1}
                            .disabled(indice == 0)
                        Spacer()
                        Button(indice == pasos.count - 1 ? "Finalizar" : "Siguiente") {
                            if indice == pasos.count - 1 {
                                dismiss()
                            } else {
                                indice += 1
                            }
                        }
                            //.disabled(indice == pasos.count - 1)
                    }
                }
                .padding()
            } else {
                Text("Aún no hay pasos para este equipo.")
            }
        }
        .navigationTitle("Mantenimiento")
    }
}
