//
//  Service.swift
//  Prueba
//
//  Created by CC on 5/29/20.
//  Copyright © 2020 CC. All rights reserved.
//

import Foundation
import Alamofire
class Service {
    fileprivate var baseUrl = ""
    
    typealias citasCallBack = (_ citas:[Cita]?, _ status: Bool, _ message:String) -> Void
    
    var citcallBack:citasCallBack?
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getallDentistas(endPoint: String) {
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {return}
            
            do {
            let dentistas = try JSONDecoder().decode([Dentista].self, from: data)
                print("dentistas == \(dentistas)")
                
            } catch {
                print("error == \(error)")
            }
        }
    }
    func getAllRegistro(endPoint: String) {
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                self.citcallBack?(nil, false, "")
                return}
            do {
            let citas = try JSONDecoder().decode([Cita].self, from: data)
                
                self.citcallBack?(citas, true,"")
            } catch {
                self.citcallBack?(nil, false, error.localizedDescription)
            }
        }
    }
    
    func citascompletionHandler(callBack: @escaping citasCallBack) {
        self.citcallBack = callBack
    }
}
