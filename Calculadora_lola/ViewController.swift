//
//  ViewController.swift
//  Calculadora_lola
//
//  Created by alumno on 8/30/24.
//

import UIKit
enum estados_de_la_calculadora{
case seleccionar_numeros
case escoger_operacion
case mostrar_resultados
}

class ViewController: UIViewController {
    var estado_actual: estados_de_la_calculadora =
    estados_de_la_calculadora.seleccionar_numeros
    
    @IBOutlet weak var texto_a_cambiar:UILabel!
    @IBOutlet weak var boton_operacion:UILabel!
    
    var botones_interffaz: Dictionary<String, IUBotonCalculadora> = [:]
    var operacion_actual: String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
       inicializar_calculadora()
    }


    @IBAction func que_hacer_pushar(_ sender: UIButton) {
        if (estado_actual == estados_de_la_calculadora.seleccionar_numeros){
            let text_a_añadir = botones_interffaz[(sender.restorationIdentifier ?? boton_operacion.restorationIdentifier) ?? "boton"]?.numero ; texto_a_cambiar.text = "\(texto_a_cambiar.text)\(text_a_añadir)"
        }
        else if (estado_actual == estados_de_la_calculadora.escoger_operacion){
            if let _mensajero: UIButton? = sender {
                operacion_actual = botones_interffaz[_mensajero!.restorationIdentifier ?? "boton_0"]?.operacion
            }
            else {
                operacion_actual = nil
            }
        }
       
        
    }
    @IBAction func boton_operacion_pulsado (_ sender: UIButton){
        if (estado_actual == estados_de_la_calculadora.seleccionar_numeros){
            estado_actual == estados_de_la_calculadora.escoger_operacion
            dibujar_numeros_u_operaciones_en_interfaz()
        }
    }
    func inicializar_calculadora () -> Void{
        crear_arreglo_botones()
    }
    func crear_arreglo_botones () -> Void {
       
        botones_interffaz = IUBotonCalculadora.crear_arreglo()
        
    }
    func dibujar_numeros_u_operaciones_en_interfaz() {
        if(estado_actual == estados_de_la_calculadora.escoger_operacion){
            
        }
        else if (estado_actual == estados_de_la_calculadora.seleccionar_numeros){
            
        }
    }
    
    
}

