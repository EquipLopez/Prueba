//
//  Paciente.swift
//  Prueba
//
//  Created by CC on 5/29/20.
//  Copyright © 2020 CC. All rights reserved.
//

import Foundation
struct Paciente: Decodable {
    var idPaciente: Int?
    var pacIdentificacion: String?
    var pacNombre: String?
    var pacApellidos: String?
    var pacFechaNacimiento: String?
    var pacSexo: String?
    
    enum CodingKeys: String, CodingKey {
        case idPaciente = "idPaciente"
        case pacIdentificacion = "pacIdentificacion"
        case pacNombre = "pacNombre"
        case pacApellidos = "pacApellidos"
        case pacFechaNacimiento = "pacFechaNacimiento"
        case pacSexo = "pacSexo"
    }
    
}
