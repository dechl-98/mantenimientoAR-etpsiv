//
//  Instruccion.swift
//  
//
//  Created by mac on 26/10/26.
//

import Foundation

enum EstadoMantenimiento: String, Codable {
    case pendiente
    case enProceso
    case completado
    case cancelado
}

struct Instruccion: Identifiable, Codable {
    let id: String
    let orden: Int
    let titulo: String
    let descripcion: String
    let herramientasNecesarias: [String]
    let advertenciaSeguridad: String?
    let nombreAnimacionAR: String?
}
