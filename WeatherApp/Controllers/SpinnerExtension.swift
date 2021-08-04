//
//  SpinnerExtension.swift
//  WeatherApp
//
//  Created by Burak Çiçek on 4.08.2021.
//

import UIKit

fileprivate var backView: UIView?

extension WeatherDetailController {
    
    func showSpinner() {
        
        backView = UIView(frame: self.view.bounds)
        backView?.backgroundColor = UIColor(red: 205/255, green: 222/255, blue: 240/255, alpha: 1)
        
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.color = .white
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(backView!)
        backView?.addSubview(spinner)
        
        spinner.centerXAnchor.constraint(equalTo: backView!.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: backView!.centerYAnchor).isActive = true
        
        spinner.startAnimating()
    }
    
    func removeSpinner() {
        
        backView?.removeFromSuperview()
        backView = nil
    }
    
}
