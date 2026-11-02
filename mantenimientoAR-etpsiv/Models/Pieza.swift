//
//  Pieza.swift
//  
//
//  Created by mac on 26/10/26.
//

import Foundation

struct Pieza: Identifiable, Codable {
    let id: String
    let nombre: String
    let descripcion: String
    let advertencias: [String]
    let ordenVisualizacion: Int
    let nombreEntidad: String
    var instrucciones: [Instruccion]
}
