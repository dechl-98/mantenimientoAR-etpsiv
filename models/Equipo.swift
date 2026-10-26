// xcode: set sdk=iOS

//
//  Equipo.swift
//  
//
//  Created by mac on 26/10/26.
//

import Foundation

//Definimos los atributos que contendrá este proyecto
struct Equipo: Identifiable {
    
    let idEquipo: UUID = UUID(); //identificador unico
    let nombre: String; //nombre del equipo (ya sea un motor, una pantalla, entre otras cosas
    let modeloTecnico: String; //Descripcion del modelo del equipo
    let nombreAnclajeAR: String //busca el objeto para colocar su contenido
    var piezas: [Pieza]; //arreglo donde estara el listado de piezas del equipo
}

