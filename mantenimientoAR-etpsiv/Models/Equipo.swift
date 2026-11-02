// xcode: set sdk=iOS

//
//  Equipo.swift
//  
//
//  Created by mac on 26/10/26.
//

import Foundation

enum TipoIdentificacion: String, Codable {
    case qr
    case seleccionManual
    case referenciaVisual
}

struct Equipo: Identifiable, Codable {
    let id: String
    let nombre: String
    let marca: String
    let modelo: String
    let descripcion: String
    let imagenReferencia: String?
    let tipoIdentificacion: TipoIdentificacion
    let nombreAnclajeAR: String?
    var piezas: [Pieza]
}
