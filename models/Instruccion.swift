//
//  Instruccion.swift
//  
//
//  Created by mac on 26/10/26.
//

import Foundation

struct Instruccion: Identifiable {
    let idInstruccion: UUID = UUID(); //id de la instruccion que se desea consultar
    let pasoNumero: Int; //numero de pasos que irá mostrando al avanzar
    let descripcion: String; //Texto que describe cada uno de los pasos para la solucion
    let descripcionAnimacionAR: String; //mostrara el texto de lo que habrá que hacer 'rotar_valvula', 'mover_filtros'
}
