//
//  CrearExamenViewController.swift
//  XCODE-TableView
//
//  Created by Ignacio Campillos Serrano on 02/11/2023.
//

import UIKit

class CrearExamenViewController: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtTotalPreguntas: UITextField!
    @IBOutlet weak var txtTotalAcertadas: UITextField!
    
    var delegate: ObtenerExamen?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnCrearExamen(_ sender: Any) {
        let nombre = txtNombre.text!
        let totalP = txtTotalPreguntas.text!
        let totalA = txtTotalAcertadas.text!
        
        if nombre.isEmpty || totalP.isEmpty || totalA.isEmpty {
            //VENTANA DE AVISO
            let alert = UIAlertController(title: "ERROR", message: "Faltan datos",preferredStyle: .alert) //VENTANA COMO TAL
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
            self.present(alert, animated: true, completion: nil) //MOSTRAR VENTANA
        }else{
            //CREO EXAMEN Y LO ENVIO
            let examen = Examen(nombre: nombre, totalPreguntas: Int(totalP)!,totalAcertadas: Int(totalA)!)
            delegate?.obtener(dato: examen)
            self.dismiss(animated: true, completion: nil)
        }
    }
    

}
