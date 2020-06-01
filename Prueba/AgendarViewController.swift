//
//  AgendarViewController.swift
//  Prueba
//
//  Created by CC on 5/31/20.
//  Copyright © 2020 CC. All rights reserved.
//

import Foundation
import UIKit


class AgendarViewController: UIViewController {
    
    @IBOutlet weak var fecha: UITextField!
    @IBOutlet weak var hora: UITextField!
    @IBOutlet weak var paciente: UITextField!
    @IBOutlet weak var dentista: UITextField!
    @IBOutlet weak var consultorio: UITextField!
    @IBOutlet weak var estado: UITextField!
    
    
   
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
        }
        
    
    @IBAction func registrar(_ sender: Any) {
        
        let semaphore = DispatchSemaphore (value: 0)

        let parameters = [
          [
            "key": "citfecha",
            "value": "\(String(describing: fecha.text!))",
            "type": "text"
          ],
          [
            "key": "cithora",
            "value": "\(String(describing: hora.text!))",
            "type": "text"
          ],
          [
            "key": "citPaciente",
            "value": "\(String(describing: paciente.text!))",
            "type": "text"
          ],
          [
            "key": "cidDentista",
            "value": "\(String(describing: dentista.text!))",
            "type": "text"
          ],
          [
            "key": "citConsultorio",
            "value": "\(String(describing: consultorio.text!))",
            "type": "text"
          ],
          [
            "key": "citestado",
            "value": "\(String(describing: estado.text!))",
            "type": "text"
          ],
          [
            "key": "citobservaciones",
            "value": "...",
            "type": "text"
          ]] as [[String : Any]]

        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        var error: Error? = nil
        for param in parameters {
          if param["disabled"] == nil {
            let paramName = param["key"]!
            body += "--\(boundary)\r\n"
            body += "Content-Disposition:form-data; name=\"\(paramName)\""
            let paramType = param["type"] as! String
            if paramType == "text" {
              let paramValue = param["value"] as! String
              body += "\r\n\r\n\(paramValue)\r\n"
            } else {
              let paramSrc = param["src"] as! String
              let fileData = try! NSData(contentsOfFile:paramSrc, options:[]) as Data
              let fileContent = String(data: fileData, encoding: .utf8)!
              body += "; filename=\"\(paramSrc)\"\r\n"
                + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
            }
          }
        }
        body += "--\(boundary)--\r\n";
        let postData = body.data(using: .utf8)

        var request = URLRequest(url: URL(string: "http://127.0.0.1:8000/api/citas")!,timeoutInterval: Double.infinity)
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
        
        fecha.text = ""
        hora.text = ""
        paciente.text = ""
        dentista.text = ""
        consultorio.text = ""
        estado.text = ""
    }
    
}
