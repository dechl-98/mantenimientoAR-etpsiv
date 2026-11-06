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
    @Published var mensajeError: String?
    
    private let equipoService: EquipoServiceProtocol
    
    init(equipoService: EquipoServiceProtocol) {
        self.equipoService = equipoService
    }
    
    convenience init() {
            self.init(equipoService: EquipoService())
        }
    
    func cargarEquipos() async {
        estaCargando = true
        mensajeError = nil
        do {
            equipos = try await equipoService.obtenerEquipos()
        } catch {
            print("Error al cargar equipos: ", error)
            mensajeError = "No se pudo cargar el catálogo de equipos."
        }
        estaCargando = false
    }
}
