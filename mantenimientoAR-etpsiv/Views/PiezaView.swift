//
//  PiezaView.swift
//  mantenimientoAR-etpsiv
//
//  Created by mac on 3/11/26.
//

import SwiftUI

struct PiezaView: View {
    let pieza: Pieza
    
    var body: some View {
        List {
            Section{
                ModeloView(entidadResaltada: pieza.nombreEntidad)
                    .frame(height: 250)
            }
            
            Section("Descripción"){
                Text(pieza.descripcion)
            }
            Section("Advertencias"){
                ForEach(pieza.advertencias, id: \.self){
                    aviso in Text(aviso)
                }
            }
            Section("Instrucciones"){
                ForEach(pieza.instrucciones){
                    paso in Text("\(paso.orden). \(paso.titulo)")
                }
            }
        }
        .navigationTitle(pieza.nombre)
    }
}
