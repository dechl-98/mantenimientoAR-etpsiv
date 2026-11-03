//
//  EquipoViewModel.swift
//  mantenimientoAR-etpsiv
//
//  Created by mac on 2/11/26.
//

import Foundation
import Combine

@MainActor
final class EquipoViewModel: ObservableObject {
    @Published var equipos: [Equipo] = []
    @Published var equipoSeleccionado: Equipo?
    @Published var estaCargando: Bool = false
    
    private let equipoService: EquipoServiceProtocol
    
    init(equipoService: EquipoServiceProtocol) {
        self.equipoService = equipoService
    }
    
    convenience init() {
            self.init(equipoService: EquipoService())
        }
    
    func cargarEquipos() async {
        estaCargando = true
        do {
            equipos = try await equipoService.obtenerEquipos()
        } catch {
            print("Error al cargar equipos: ", error)
        }
        estaCargando = false
    }
}
