//
//  Bundle+Decode.swift
//  mantenimientoAR-etpsiv
//
//  Created by mac on 3/11/26.
//

import Foundation

enum ErrorDeCarga: Error {
    case archivoNoEncontrado(String)
}

extension Bundle {
    func decode<T: Decodable>(_ file: String) throws -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            throw ErrorDeCarga.archivoNoEncontrado(file)
        }
        
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
