//
//  Cosultorio.swift
//  Prueba
//
//  Created by CC on 5/29/20.
//  Copyright © 2020 CC. All rights reserved.
//

import Foundation
struct Consultorio: Decodable {
    var idConsultorio: Int?
    var conNombre: String?

    enum CodingKeys: String, CodingKey {
        case idConsultorio = "idConsultorio"
        case conNombre = "conNombre"
    }
}
