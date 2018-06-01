//
//  AppGuide.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 31/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit

/* Abstract:
// TODO: completar...
*/


class AppGuideViewController: UICollectionViewController {
	
	//*****************************************************************
	// MARK: - Life Cycle
	//*****************************************************************
	
	override func viewDidLoad() {
		
		// pone el fondo del 'collection view' de color verde
		collectionView?.backgroundColor = .white
		// registra la celda personalizada ´PageCell´
		collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
		// habilita el 'collection view' para la paginación
		collectionView?.isPagingEnabled = true
		
		// autolayout
		setupBottomControls()
		
	}
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// Model //
	
	/// un array con las páginas con su imagen y texto de cabecera
	let pages: [Page] = [
		Page(imageName: "clave_image", headerText: "Join us today in our fun and games!", bodyText: "Are you ready for loads an loads of fun? Don't wait any longer! We hope to see in out stores soon."),
		Page(imageName: "headphones_image", headerText: "Subscribe and get coupons on ourn daily events", bodyText: "Get notified of the savings inmediately when we announce then on our website.Make sure to also give as any feedback you have."),
		Page(imageName: "play_button", headerText: "VIP members special services", bodyText: ""),
		Page(imageName: "clave_image", headerText: "Join us today in our fun and games!", bodyText: "Are you ready for loads an loads of fun? Don't wait any longer! We hope to see in out stores soon."),
		Page(imageName: "headphones_image", headerText: "Subscribe and get coupons on ourn daily events", bodyText: "Get notified of the savings inmediately when we announce then on our website.Make sure to also give as any feedback you have."),
		Page(imageName: "play_button", headerText: "VIP members special services", bodyText: "")
	]
	
	
	// View //
	
	/// un botón con la leyenda ´previo´
	let previousButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("PREV", for: .normal)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
		button.setTitleColor(.gray, for: .normal)
		// action!
		button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	/// un botón con la leyenda ´siguiente´
	let nextButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("NEXT", for: .normal)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
		// construye un color personalizado
		let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
		// y se lo aplica al color del título
		button.setTitleColor(pinkColor, for: .normal)
		// asocia la func 'handleNext' con 'nextButton' cuando el usuario toca dentro de sus límites
		button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
		//
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	/// un controlador de paginación
	lazy var pageControl: UIPageControl = {
		let pc = UIPageControl()
		pc.currentPage = 0
		pc.numberOfPages = pages.count
		pc.currentPageIndicatorTintColor = .mainPink
		pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
		return pc
	}()
	
	
	//*****************************************************************
	// MARK: - Actions
	//*****************************************************************
	
	/// task: manejar el paso de la página actual a la siguiente
	@objc private func handleNext() {
		print("Trying to advance to next")
		
		// 'min()' compara dos valores y devuelve el menor
		// en este caso compara el valor de la página actual + 1 (o sea, da como resultado la página siguiente a la actual)
		// contra la cantidad de elementos que tiene el modelo (en este caso, 3) menos uno
		let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
		//
		let indexPath = IndexPath(item: nextIndex, section: 0)
		pageControl.currentPage = nextIndex
		collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
		
	}
	
	/// task: manejar el paso de la página actual a la previa
	@objc private func handlePrev() {
		print("Trying to advance to previous")
		
		let prevIndex = max(pageControl.currentPage - 1, 0)
		//
		let indexPath = IndexPath(item: prevIndex, section: 0)
		pageControl.currentPage = prevIndex
		collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
		
	}
	
	//*****************************************************************
	// MARK: - Methods (scroll - pagination)
	//*****************************************************************
	
	/// task: decirle al delegado cuando el usuario termina de desplazar el contenido.
	override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
		
		// el estado del puntero que recorre la coordenada x
		let x = targetContentOffset.pointee.x
		// calcula cual es la página actual de acuerdo a dónde se encuentra el puntero x
		pageControl.currentPage = Int(x / view.frame.width)
		
		// test
		print(x, view.frame.width, x / view.frame.width)
	}
	
	
} // end class


//*****************************************************************
// MARK: - Collection View (Data Source)
//*****************************************************************

extension AppGuideViewController  {
	
	/// task: poner las cantidad de items que va a tener la sección
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return pages.count
	}
	
	/// task: crear la celda reutilizable para cada celda de la colleción
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		// pone un nombre para identificador para la celda reutilizable
		// y se la asigna a la dirección de cada uno de las 4 celdas
		// a su vez castea la clase 'UICollectionViewCell' a 'PageCell'
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
		
		// la ruta para cada ítem del array
		//		let page = pages.count[indexPath.item]
		let page = pages[indexPath.item]
		// asigna la página de la celda al item actual
		cell.page = page
		
		// devuelve la celda ya configurada
		return cell
		
	}
	
}

//*****************************************************************
// MARK: - Collection View (Layout)
//*****************************************************************

extension AppGuideViewController: UICollectionViewDelegateFlowLayout {
	
	/// task: definir el tamaño de la celda
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: view.frame.width, height: view.frame.height)
	}
	
	/// task: definir la cantidad el espacio mínimo entre cada sección (en este caso a 0)
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
}


extension AppGuideViewController {
	
	/// task: notificar al contenedor que el tamaño de su vista está a punto de cambiar.
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		
		// UIViewControllerTransitionCoordinator: un set de métodos relacionados con las transiciones del vc
		coordinator.animate(alongsideTransition: { (_) in
			
			// invalida el diseño actual y desencadena una actualización de diseño.
			self.collectionViewLayout.invalidateLayout()
			
			if self.pageControl.currentPage == 0 {
				
				self.collectionView?.contentOffset = .zero
			}
			
			// la 'dirección' de la página actual
			let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
			// centra horizontalmente el item desplazado 👈
			self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
			
		}) { (_) in
			
		}
	}
	
}


extension AppGuideViewController {
	
	/// task: configurar el diseño de los controles del 'fondo'
	func setupBottomControls() {
		
		// stack views ------------------------------------------
		// pone las dos vistas creadas dentro de un 'stack view'
		let bottomControlStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
		bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
		// distribuye los elementos que contiene el stack view de modo que el tamaño de su contenido sea igual
		bottomControlStackView.distribution = .fillEqually
		//  ------------------------------------------------------
		
		view.addSubview(bottomControlStackView)
		
		// aplicando restricciones, un array de 'anclas'
		NSLayoutConstraint.activate([
			// ancla 'previousButton' con el bottom de 'safe area'
			bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			// ancla 'previousButton' con la derecha de 'safe area'
			bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			// ancla 'previousButton' con la izquierda de 'safe area'
			bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)
			])
	}
	
}


struct Page {
	
	let imageName: String
	let headerText: String
	let bodyText: String
	
}



/// crea, mediante una extensión de UIColor, un color personalizado
extension UIColor {
	
	static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
	
}


class PageCell: UICollectionViewCell {
	
	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		// configura el diseño de la celda
		setupLayout()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	var page: Page? {
		didSet {
			//			print(page?.imageName ?? "")
			
			guard let unwrappedPage = page else { return }
			
			// la imagen del topo
			topImageView.image = UIImage(named: unwrappedPage.imageName)
			
			// el texto de la cabecera
			let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
			
			// el texto del cuerpo
			attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
			
			descriptionTextView.attributedText = attributedText
			descriptionTextView.textAlignment = .center
			
			
		}
		
	}
	
	/// la imágen del botón play
	private let topImageView : UIImageView = {
		
		// construye una vista de imágen con el botón play
		let imageView = UIImageView(image: #imageLiteral(resourceName: "play_button"))
		// trabaja el aspecto del radio de la 'imageView', en este caso
		imageView.contentMode = .scaleAspectFit
		// esto habilita autolayout para 'imageView' 👈
		imageView.translatesAutoresizingMaskIntoConstraints =  false
		// devuelve la imágen ya configurada
		return imageView
	}()
	
	/// un texto con una descripción
	private let descriptionTextView : UITextView = {
		
		/// una vista de texto
		let textView = UITextView()
		
		// usando 'NSMutableAttributedString'
		// esta clase permite configurar los atributos de uno o varios strings!
		let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
		
		attributedText.append(NSAttributedString(string: "\n\n Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in out stores soon.",
												 attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13),NSAttributedStringKey.foregroundColor: UIColor.gray]))
		
		// le agrega a la vista de texto estos atributos (notar que se los aplica a dos strings diferentes)
		textView.attributedText = attributedText
		// alinea el texto
		textView.textAlignment = .center
		// permite que se le aplica autolayout a este text view
		textView.translatesAutoresizingMaskIntoConstraints =  false
		// este texto no se puede editar
		textView.isEditable = false
		// y tiene la opción de desplazamiento deshabilitada
		textView.isScrollEnabled =  false
		
		// devuelve la vista de texto con todas las configuraciones realizadas
		return textView
	}()
	
	
	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	/// task: configurar el diseño de los elementos visuales
	private func setupLayout() {
		
		// una imagen que actúa como un contenedor que ocupa la mitad de la pantalla
		let topImageContainerView = UIView()
		addSubview(topImageContainerView)
		
		// aplicando autolayout a 'topImageContainerView' 👈
		
		// habilita autolayout
		topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
		// la restricción del ancho de la vista hace que ocupe la mitad de la supervista
		topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
		// ancla la vista 'topImageContainerView' al tope de la supervista
		topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		// ancla la vista a la izquierda de la supervista
		topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		// ancla la vista la derecha de la supervista
		topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		// agreaga dentro de 'topImageContainerView' la vista 'playImageView' 👈
		topImageContainerView.addSubview(topImageView)
		
		// aplicando autolayout a 'playImageView' 👈
		// ancla 'playImageView' a la mitad del eje X de 'topImageContainerView'
		topImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
		// ancla 'playImageView' a la mitad del eje Y de 'topImageContainerView'
		topImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
		// ancla 'playImageView' sobre la mitad del ancho de 'topImageContainerView'
		topImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
		
		
		// aplicando autolayout a 'descriptionTextView' 👈
		
		// agrega la vista de 'descriptionTextView'
		addSubview(descriptionTextView)
		// ancla el 'descriptionTextView' a 150px del tope del 'playImageView'
		descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
		// ancla el 'descriptionTextView' en el centro de las celda
		descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
		descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
		// ancla el 'descriptionTextView' sobre el fondo de la celda
		descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
		
		
	}
}




