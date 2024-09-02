//
//  ViewController.swift
//  Calculadora_lola
//
//  Created by alumno on 8/30/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Hola_mundo: UILabel!
    
    @IBOutlet weak var boton_para_hacer_cosas: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func que_hacer_pushar(_ sender: Any) {
        labelstr_t.text = "Que hacer a pushar"
    }
}

