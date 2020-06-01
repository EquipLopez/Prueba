//
//  Especialidad.swift
//  Prueba
//
//  Created by CC on 5/29/20.
//  Copyright © 2020 CC. All rights reserved.
//

import Foundation

struct Especialidad: Decodable {
    var idespecialidad: Int?
    var espNombre: String?

    enum CodingKeys: String, CodingKey {
        case idespecialidad = "idespecialidad"
        case espNombre = "espNombre"
    }
}
