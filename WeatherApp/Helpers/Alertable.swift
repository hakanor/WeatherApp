//
//  Alertable.swift
//  WeatherApp
//
//  Created by Hakan Or on 11.07.2022.
//

import UIKit

protocol Alertable where Self: UIViewController {
    func displayAlert(title: String, message: String?, buttonTitle: String?)
}

extension Alertable {
    func displayAlert(title: String, message: String?, buttonTitle: String? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let buttonTitle = buttonTitle {
            alertController.addAction(UIAlertAction(title: buttonTitle, style: .default))
        }
        
        present(alertController, animated: true)
    }
}
