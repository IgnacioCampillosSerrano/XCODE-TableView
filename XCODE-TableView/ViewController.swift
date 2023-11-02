//
//  ViewController.swift
//  XCODE-TableView
//
//  Created by Ignacio Campillos Serrano on 02/11/2023.
//

import UIKit

class ViewController: UIViewController, ObtenerExamen {

    @IBOutlet weak var txtIndice: UITextField!
    @IBOutlet weak var lbResultado: UILabel!
   
    var listaExamenes: [Examen]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaExamenes = []
     }

    @IBAction func btnVerExamen(_ sender: Any) {
        let indice = txtIndice.text!
        
        if !indice.isEmpty && Int(indice)! >= 1 && Int(indice)! <= listaExamenes.count{
            lbResultado.text = listaExamenes[Int(indice)! - 1].toString()
        }else{
            lbResultado.text = "Error en el indice"
        }
    }
     
    func obtener(dato: Examen){
        listaExamenes.append(dato)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CREAR" {
            let destino = segue.destination as! CrearExamenViewController
            destino.delegate = self
        }
    }
}

