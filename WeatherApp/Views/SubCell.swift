//
//  SubCell.swift
//  WeatherApp
//
//  Created by Burak Çiçek on 2.08.2021.
//

import UIKit

class SubCell: UICollectionViewCell {
    
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var sunRiseLabel: UILabel!
    @IBOutlet weak var sunSetLabel: UILabel!
    
    var weatherResponse: WeatherResponse? {
        
        didSet {
            
            if let humidity = weatherResponse?.humidity {
                humidityLabel.text = "Humidity\n%\(String(humidity))"
            }
            
            
            let df = DateFormatter()
            //df.timeZone = TimeZone(abbreviation: "GMT")
            df.dateFormat = "HH:mm"
            
            
            if let sunrise = weatherResponse?.sunrise {
                let date = Date(timeIntervalSince1970: TimeInterval(sunrise))
                let sunRiseString = df.string(from: date)
                sunRiseLabel.text = "Sunrise\n\(sunRiseString)"
            }
            
            if let sunset = weatherResponse?.sunset {
                let date = Date(timeIntervalSince1970: TimeInterval(sunset))
                let sunSetString = df.string(from: date)
                sunSetLabel.text = "Sunset\n\(sunSetString)"
            }
            
        }
        
    }
    
}
