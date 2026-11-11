//
//  ARModeloView.swift
//  mantenimientoAR-etpsiv
//
//  Created by mac on 7/11/26.
//

import SwiftUI
import RealityKit

struct ARModeloView: View {
    @State private var motor = Entity()
    @State private var escala : Float = 0.5
    @State private var giroX: Float = 0
    @State private var giroY: Float = 0
    
    var body: some View {
        RealityView {
            content in
            content.camera = .spatialTracking
            
            //let ancla = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: [0.2, 0.2]))
            let ancla = AnchorEntity(world: [0, -0.4, -1])
            content.add(ancla)
            
            do {
                let modelo = try await Entity(named: "motor")
                motor.addChild(modelo)
                motor.components.set(InputTargetComponent())
                motor.generateCollisionShapes(recursive: true)
                motor.scale = SIMD3<Float>(repeating: escala)
                ancla.addChild(motor)
                //print("Motor agregado al ancla")
            } catch {
                print("Error al cargar el modelo AR: ", error)
            }
        }
        .gesture(
            MagnifyGesture()
                .targetedToEntity(motor)
                .onChanged{ value in
                    let nueva = min(max(escala * Float(value.magnification), 0.1), 2.0)
                    motor.scale = SIMD3<Float>(repeating: nueva)
                }
                .onEnded{ value in
                    escala = min(max(escala * Float(value.magnification), 0.1), 2.0)
                }
        )
        .simultaneousGesture(
            DragGesture()
                .targetedToEntity(motor)
                .onChanged{ value in
                    let anguloY = giroY + Float(value.translation.width) * 0.01
                    let anguloX = giroX + Float(value.translation.height) * 0.01
                    
                    let rotacionY = simd_quatf(angle: anguloY, axis: [0, 1, 0])
                    let rotacionX = simd_quatf(angle: anguloX, axis: [1, 0, 0])
                    
                    motor.orientation = rotacionY * rotacionX
                }
                .onEnded{ value in
                    giroY += Float(value.translation.width) * 0.01
                    giroX += Float(value.translation.height) * 0.01
                }
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

