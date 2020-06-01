//
//  RegistroViewController.swift
//  Prueba
//
//  Created by CC on 5/31/20.
//  Copyright © 2020 CC. All rights reserved.
//
import UIKit

class RegistroViewController: UIViewController {
    
    @IBOutlet weak var registroTable: UITableView!
    var citas = [Cita]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        registroTable.dataSource = self
        
        let service = Service(baseUrl: "http://127.0.0.1:8000/api/")
        service.getAllRegistro(endPoint: "citas")
        service.citascompletionHandler { [weak self] (citas, status, message) in
        if status {
            guard let self = self else {return}
            guard let _citas = citas else {return}
            self.citas = _citas
            self.registroTable.reloadData()
        }
        
        }
    }
}

extension RegistroViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "citacell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "citacell")
        }
        
        let cita = citas[indexPath.row]
        cell?.textLabel?.text = "Paciente: " + (cita.citPaciente ?? "") + " - Dentista: " + (cita.cidDentista ?? "")
        cell?.detailTextLabel?.text = "Fecha: " + (cita.citfecha ?? "") + " - Hora: " + (cita.cithora ?? "")
        return cell!
    }
}
