//
//  EquipoView.swift
//  mantenimientoAR-etpsiv
//
//  Created by mac on 3/11/26.
//

import SwiftUI

struct EquipoView: View {
    let equipo: Equipo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            ModeloView(entidadResaltada: nil)
                .frame(height: 250)
            NavigationLink("Iniciar recorrido guiado"){
                MantenimientoView(equipo: equipo)
            }
            List(equipo.piezas){
                pieza in NavigationLink(destination: PiezaView(pieza: pieza)){
                    VStack(alignment: .leading){
                        Text(pieza.nombre)
                            .font(.body)
                    }
                }
            }
            .navigationTitle(equipo.nombre)
        }
        .padding()
    }
}
