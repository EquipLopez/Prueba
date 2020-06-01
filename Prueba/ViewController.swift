//
//  ViewController.swift
//  Prueba
//
//  Created by CC on 5/29/20.
//  Copyright © 2020 CC. All rights reserved.
//

import UIKit
import Foundation



class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
         //let service = Service(baseUrl: "http://127.0.0.1:8000/api/")
        //service.getAllRegistro(endPoint: "dentistas")
        
        
       

        var request = URLRequest(url: URL(string: "http://127.0.0.1:8000/api/dentistas")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
         let datos = String(data: data, encoding: .utf8)!
          
          
        }

        task.resume()
        
    
        
        
       
        }
    }


