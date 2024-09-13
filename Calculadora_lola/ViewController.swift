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
    estados_de_la_calculadora.mostrar_resultados
    
    @IBOutlet weak var texto_a_cambiar:UILabel!
    
    @IBOutlet weak var boton_operacion:UILabel!
    @IBOutlet weak var vista_stack:UIStackView!
    
    
    var botones_interffaz: Dictionary<String, IUBotonCalculadora> = [:]
    var operacion_actual: String? = nil
    var numero_anterior: Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inicializar_calculadora()
    }
    
    
    @IBAction func que_hacer_pushar(_ sender: UIButton) {
        if(estado_actual == estados_de_la_calculadora.seleccionar_numeros){
                   if let _mensajero_id = sender.restorationIdentifier{
                       let texto_cache = botones_interffaz[_mensajero_id]?.numero
                       texto_a_cambiar.text = "\(texto_a_cambiar.text ?? "")\(texto_cache!)"
                   }
               }
        else if (estado_actual == estados_de_la_calculadora.escoger_operacion){
                    if let _mensajero_id = sender.restorationIdentifier{
                        operacion_actual = botones_interffaz[_mensajero_id]?.operacion
                        if let numero_actual: String = texto_a_cambiar.text{
                            numero_anterior = Double (numero_actual) ?? 0.0
                        }
                        estado_actual = estados_de_la_calculadora.seleccionar_numeros
                    }
                    else {
                        operacion_actual = nil
                    }
                }
        else if (estado_actual == estados_de_la_calculadora.mostrar_resultados){
            if let _mensajero_id = sender.restorationIdentifier{
                let texto_cache = botones_interffaz[_mensajero_id]?.numero
                texto_a_cambiar.text = "\(texto_cache!)"
            }
                }
        
                
                dibujar_numeros_u_operaciones_en_interfaz()
    }
    @IBAction func boton_operacion_pulsado (_ sender: UIButton){
        switch(estado_actual){
                   case .seleccionar_numeros:
                       estado_actual = .escoger_operacion
                   case .escoger_operacion:
                       estado_actual = .seleccionar_numeros
        case .mostrar_resultados:
                       estado_actual = .escoger_operacion
               }
               
               dibujar_numeros_u_operaciones_en_interfaz()
               
           }
    func inicializar_calculadora () -> Void{
        crear_arreglo_botones()
        identificar_botones()
    }
    func crear_arreglo_botones () -> Void {
        
        botones_interffaz = IUBotonCalculadora.crear_arreglo_botones()
        
    }
    func dibujar_numeros_u_operaciones_en_interfaz() {
        switch(estado_actual){
        case .escoger_operacion:
                        for elemento in botones_interffaz.values{
                            elemento.referencia_a_boton_interfaz?.setTitle(
                                    elemento.operacion,
                                    for: .normal
                                    )
                            elemento.referencia_a_boton_interfaz?.setTitle("Ñ", for: .selected)
                        }
                    
        case .seleccionar_numeros:
                        for elemento in botones_interffaz.values{
                            elemento.referencia_a_boton_interfaz?.setTitle(
                                String(elemento.numero),
                                for: .normal
                            )
                        }
        case .mostrar_resultados:
                            0 == 0
                }
    }
    
    func identificar_botones(){
        for pila_de_componentes in vista_stack.subviews{
            for boton in pila_de_componentes.subviews{
                
                if let identificador = boton.restorationIdentifier{
                    botones_interffaz[identificador]?.referencia_a_boton_interfaz = boton as? UIButton
                }
                
               
                        dibujar_numeros_u_operaciones_en_interfaz()
                
            }
        }
    }
    
    @IBAction func obtener_resultado(_ sender: Any) {
        if numero_anterior != 0.0 && texto_a_cambiar.text != ""{
            var numero_actual: Double = 0.0
            if let numero_actual_string = texto_a_cambiar.text {
                numero_actual = Double(numero_actual_string) ?? 0.0
            }
                
                switch(operacion_actual)
            {
            case "+":
                texto_a_cambiar.text = "\(numero_anterior + numero_actual)"
            case "-":
                texto_a_cambiar.text = "\(numero_anterior - numero_actual)"
            case "*":
                texto_a_cambiar.text = "\(numero_anterior * numero_actual)"
            case "/":
                texto_a_cambiar.text = "\(numero_anterior / numero_actual)"
            default:
                texto_a_cambiar.text = "Hay un error"
            }
            estado_actual = estados_de_la_calculadora.mostrar_resultados   
                
        }
    }
}
