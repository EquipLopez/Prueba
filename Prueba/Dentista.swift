//
//  Dentista.swift
//  Prueba
//
//  Created by CC on 5/29/20.
//  Copyright © 2020 CC. All rights reserved.
//

import Foundation
struct Dentista: Decodable {
    var idDentista: Int?
    var denIdentificacion: String?
    var denNombres: String?
    var denApellidos: String?
    var denEspecialidad: String?
    var denTelefono: String?
    var denCorreo: String?
    
    enum CodingKeys: String, CodingKey {
        case idDentista = "idDentista"
        case denIdentificacion = "denIdentificacion"
        case denNombres = "denNombres"
        case denApellidos = "denApellidos"
        case denEspecialidad = "denEspecialidad"
        case denTelefono = "denTelefono"
        case denCorreo = "denCorreo"
    }
    
}

