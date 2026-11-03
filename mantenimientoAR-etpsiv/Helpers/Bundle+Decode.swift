//
//  Bundle+Decode.swift
//  mantenimientoAR-etpsiv
//
//  Created by mac on 3/11/26.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("No se puede encontrar el archivo \(file) desde el Bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("No se puede encontrar el archivo \(file) desde el Bundle.")
        }
        
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Error al decodificar \(file): \(error)")
        }
    }
}
