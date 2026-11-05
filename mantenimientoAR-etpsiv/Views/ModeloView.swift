//
//  ModeloView.swift
//  mantenimientoAR-etpsiv
//
//  Created by mac on 4/11/26.
//

import SwiftUI
import RealityKit

struct ModeloView: View {
    let entidadResaltada: String?
    var body: some View {
        RealityView{ content in
            do {
                let motor = try await Entity(named: "motor")
                content.add(motor)
                if let nombre = entidadResaltada,
                   let pieza = motor.findEntity(named: nombre){
                    aplicarResaltado(a: pieza)
                }
            } catch {
                print("Error al cargar el modelo: ", error)
            }
          }
        }
    func aplicarResaltado(a entidad: Entity) {
        if var modelo = entidad.components[ModelComponent.self]{
            let material = SimpleMaterial(color: .orange, isMetallic: false)
            modelo.materials = Array(repeating: material, count: modelo.materials.count)
            entidad.components.set(modelo)
        }
        for hijo in entidad.children {
            aplicarResaltado(a: hijo)
        }
    }
}
