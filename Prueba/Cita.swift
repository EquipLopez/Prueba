//
//  Cita.swift
//  Prueba
//
//  Created by CC on 5/29/20.
//  Copyright © 2020 CC. All rights reserved.
//

import Foundation

struct Cita: Decodable {
    var idcita: Int?
    var citfecha: String?
    var cithora: String?
    var citPaciente: String?
    var cidDentista: String?
    var citConsultorio: String?
    var citestado: String?
    var citobservaciones: String?
    
    enum CodingKeys: String, CodingKey {
        case idcita = "idcita"
        case citfecha = "citfecha"
        case cithora = "cithora"
        case citPaciente = "citPaciente"
        case cidDentista = "cidDentista"
        case citConsultorio = "citConsultorio"
        case citestado = "citestado"
        case citobservaciones = "citobservaciones"
    }
    
}
