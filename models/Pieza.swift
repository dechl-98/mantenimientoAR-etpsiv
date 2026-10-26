//
//  Pieza.swift
//  
//
//  Created by mac on 26/10/26.
//

import Foundation

struct Pieza: Identifiable {
    let idPieza: UUID = UUID(); //identificador de las piezas de cada paso
    let nombrePieza: String; //nombre de cada una de las piezas que componen el equipo
    let nombreEntidad: String; //servirá para conectar con el objeto 3d
    var instrucciones: [Instruccion] // arreglo que llevara todos los pasos secuenciales
    
}
