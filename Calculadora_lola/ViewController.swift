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
    var botones_interffaz: Dictionary<String, IUBotonCalculadora> = [:]
    var operacion_actual: String? = nil
    
    @IBOutlet weak var boton_operacion:UILabel!
    @IBOutlet weak var vista_stack:UIStackView!
    
    
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
            dibujar_numeros_u_operaciones_en_interfaz()
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
        identificar_botones()
    }
    func crear_arreglo_botones () -> Void {
       
        botones_interffaz = IUBotonCalculadora.crear_arreglo_botones()
        
    }
    func dibujar_numeros_u_operaciones_en_interfaz() {
        if(estado_actual == estados_de_la_calculadora.escoger_operacion){
            for elemento in botones_interffaz.values{
                elemento.referencia_a_boton_interfaz?.setTitle("ñ", for: .normal)
        }
        else if (estado_actual == estados_de_la_calculadora.seleccionar_numeros){
            for elemento in botones_interffaz.values{
                elemento.referencia_a_boton_interfaz?.setTitle(String(elemento.numero), for: .normal)
        }
    }
    func identificar_botones(){
        for pila_de_componentes in vista_stack.subviews{
            for boton in pila_de_componentes.subviews{
                
                if let identificador = boton.restorationIdentifier{
                    print(botones_interffaz[identificador]?.referencia_a_boton_interfaz = boton as? UIButton)
                }
                
                for elemento in botones_interffaz.values{
                    elemento.referencia_a_boton_interfaz?.setTitle("ñ", for: .normal)
                    
                }
                
            }
        }
    }
    
}

