//
//  MainCell.swift
//  WeatherApp
//
//  Created by Burak Çiçek on 2.08.2021.
//

import UIKit

class MainCell: UICollectionViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var describingLabel: UILabel!
    @IBOutlet weak var realFeelLabel: UILabel!
    
    var weatherResponse: WeatherResponse? {
        didSet {
            
            cityLabel.text = weatherResponse?.name
            
            if let temp = weatherResponse?.temp {
                degreeLabel.text = String(format: "%.0f", temp) + "°"
            }
            
            describingLabel.text = weatherResponse?.weather[0].description
            
            if let feelsLike = weatherResponse?.feelsLike {
                realFeelLabel.text = ("Feels like \(String(format: "%.0f", feelsLike))") + "°"
            }
            
        }
    }
    
}
