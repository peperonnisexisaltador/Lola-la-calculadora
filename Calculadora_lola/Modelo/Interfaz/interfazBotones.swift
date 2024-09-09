//
//  interfazBotones.swift
//  Calculadora_lola
//
//  Created by alumno on 9/6/24.
//

import Foundation

//Interfaz usuario [Nombre de la clase on estructura]
struct IUBotonCalculadora{
    var restorationID: String
    var numero: Character
    var operacion: String
    init(_ id: String, numero: Character, operacion: String) {
        self.restorationID = id
        self.numero = numero
        self.operacion = operacion
    }
    static func crear_arreglo() -> Dictionary<String, IUBotonCalculadora>{
        var botones_interfaz: Dictionary <String, IUBotonCalculadora> = [:]

        
        
        botones_interfaz ["boton_0"] = IUBotonCalculadora (
                                        "boton0",
                                        numero: Character ("0"),
                                        operacion: ""
                                        )
        
        botones_interfaz ["boton_1"] = IUBotonCalculadora (
                                        "boton1",
                                        numero: Character ("1"),
                                        operacion: "+"
                                        )
        
        botones_interfaz ["boton_2"] = IUBotonCalculadora (
                                        "boton2",
                                        numero: Character ("2"),
                                        operacion: ""
                                        )
        
        botones_interfaz ["boton_3"] = IUBotonCalculadora (
                                        "boton3",
                                        numero: Character ("3"),
                                        operacion: "-"
                                        )
        
        botones_interfaz ["boton_4"] = IUBotonCalculadora (
                                        "boton4",
                                        numero: Character ("4"),
                                        operacion: ""
                                        )
        
        botones_interfaz ["boton_5"] = IUBotonCalculadora (
                                        "boton5",
                                        numero: Character ("5"),
                                        operacion: ""
                                        )
        
        botones_interfaz ["boton_6"] = IUBotonCalculadora (
                                        "boton6",
                                        numero: Character ("6"),
                                        operacion: ""
                                        )
        
        botones_interfaz ["boton_7"] = IUBotonCalculadora (
                                        "boton7",
                                        numero: Character ("7"),
                                        operacion: "*"
                                        )
        
        botones_interfaz ["boton_8"] = IUBotonCalculadora (
                                        "boton8",
                                        numero: Character ("8"),
                                        operacion: ""
                                        )
        
        botones_interfaz ["boton_9"] = IUBotonCalculadora (
                                        "boton9",
                                        numero: Character ("9"),
                                        operacion: "/"
                                        )
        
        return botones_interfaz
    }
}

