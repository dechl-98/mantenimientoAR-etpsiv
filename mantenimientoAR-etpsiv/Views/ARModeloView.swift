//
//  ARModeloView.swift
//  mantenimientoAR-etpsiv
//
//  Created by mac on 7/11/26.
//

import SwiftUI
import RealityKit

struct ARModeloView: View {
    var body: some View {
        RealityView {
            content in
            content.camera = .spatialTracking
            
            //let ancla = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: [0.2, 0.2]))
            let ancla = AnchorEntity(world: [0, -0.4, -1])
            content.add(ancla)
            
            do {
                let motor = try await Entity(named: "motor")
                motor.scale = SIMD3<Float>(repeating: 0.5)
                ancla.addChild(motor)
                print("Motor agregado al ancla")
            } catch {
                print("Error al cargar el modelo AR: ", error)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

