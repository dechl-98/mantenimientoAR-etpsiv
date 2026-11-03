//
//  EquipoSerivce.swift
//  mantenimientoAR-etpsiv
//
//  Created by mac on 2/11/26.
//

import Foundation

protocol EquipoServiceProtocol {
    func obtenerEquipos() async throws -> [Equipo]
}

final class EquipoService: EquipoServiceProtocol {
    func obtenerEquipos() async throws -> [Equipo] {
        // Implementación de lectura local de JSON planeada para el Día 2
        
        let equipos: [Equipo] = Bundle.main.decode("equipos.json")
        return equipos
    }
}
