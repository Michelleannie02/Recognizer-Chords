//
//  DataController.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 13/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import Foundation
import CoreData

/* Abstract:
Una clase para encapsular las configuraciones de la pila y su funcionalidad.
*/

//*****************************************************************
// MARK: - Core Data Stack
//*****************************************************************

/*
Esta clase se usa para hacer 3 cosas:
1-para tener una instancia del contenedor persistente
2-para ayudarnos a cargar el almacén persistente
3-y para ayudarnos en el acceso al contexto
*/

class DataController {
	
	/// 1-crear el contendor persistente ..............................
	
	// el contenedor persistente
	let persistentContainer: NSPersistentContainer
	// inicializa el contenedor persistente de un modelo dado
	init(modelName: String) {
		persistentContainer = NSPersistentContainer(name: modelName)
	}
	
	/// 2-cargar el almacen persistente ...............................
	
	// carga los almacenes persistentes, es decir, los datos persistidos
	func load(completion: (() -> Void)? = nil) {
		persistentContainer.loadPersistentStores { storeDescription, error in
			
			guard error == nil else {
				fatalError(error!.localizedDescription)
			}
			//self.autoSaveViewContext()
			completion?()
		}
	}
	
	/// 3- acceder al contexto ...........................................
	
	// el contexto revisa si hay datos persistidos (en el contenedor persistente)
	var viewContext: NSManagedObjectContext {
		// el contenedor persistente tiene dos tareas:
		// 1-ayuda a configurar el resto del stack
		// 2-proporciona variables y méotdos útiles para trabajar con contextos
		return persistentContainer.viewContext
	}
}

//*****************************************************************
// MARK: - Core Data - Autosave
//*****************************************************************

extension DataController {
	
	/// task: cada 30 segundos observar si hay cambios en el contexto, y de ser así, guardarlos
	func autoSaveViewContext(interval: TimeInterval = 30) {
		
		// guard
		guard interval > 0 else {
			debugPrint("cannot set negative autosave interval")
			return
		}
		
		// si es que hay cambios en el contexto, guardar..
		if viewContext.hasChanges {
			try? viewContext.save()
		}
		
		// dispatch
		DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
			self.autoSaveViewContext(interval: interval)
		}
		
		// test
		debugPrint("autosaving")
	}
}
