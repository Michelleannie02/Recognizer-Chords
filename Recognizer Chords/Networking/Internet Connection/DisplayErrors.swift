//
//  DisplayErrors.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 24/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import Foundation

/*
Abstract:
Enumeración de los posibles errores a mostrar como mensajes dentro de 'Alerts Views' al usuario. El formato de estos mensajes es 'título' y 'descripción'.
*/

struct Errors {
	
	enum Message: Error {
		
		// Title
		case noInternet
		case requestError
		
		var title: String {
			switch self {
			case .noInternet:
				return "No Internet"
			case .requestError:
				return "Request Error"
			default:
				return ""
			}
		}
		
		// Description
		case no_Internet
		
		var description: String {
			switch self {
			case .no_Internet:
				return "Su dispositivo no está conectado a internet. Por favor, conéctelo"
			default:
				return ""
			}
		}
	}
}
