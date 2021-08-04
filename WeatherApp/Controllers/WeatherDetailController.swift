//
//  ViewController.swift
//  WeatherApp
//
//  Created by Burak Çiçek on 30.07.2021.
//

import UIKit
import CoreLocation

class WeatherDetailController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let mainCell = "mainCell"
    private let subCell = "subCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let locationManager = CLLocationManager()
    
    var weather: WeatherResponse?
    var currentlocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestLocation()
        } else {
            print("Error Location Service")
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showSpinner()
    }

    // MARK: - API Response Method
    
    func getWeatherData() {
        
        WeatherApiRequest.getWeather { weatherResponse in
            
            self.weather = weatherResponse
            self.collectionView.reloadData()
            self.removeSpinner()
        } onError: { error in
            print(error)
        }
        
    }

}

    // MARK: - Location Manager Methods

extension WeatherDetailController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //guard let location: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
        if let location = locations.last {
            
            self.currentlocation = location
            
            let latitude: Double = self.currentlocation!.coordinate.latitude
            let longitude: Double = self.currentlocation!.coordinate.longitude
            
            Network.shared.setLatitude(latitude)
            Network.shared.setLongitude(longitude)
            
            print("locations = \(latitude) \(longitude)")
            print("LOCATION DID UPDATE CALLED")
            
            getWeatherData()
        }
         
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
         print("Failed to find user's location: \(error.localizedDescription)")
    }
    
    // MARK: - CollectionView Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainCell, for: indexPath) as! MainCell
            cell.weatherResponse = weather
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: subCell, for: indexPath) as! SubCell
        cell.weatherResponse = weather
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 {
            return CGSize(width: view.frame.width, height: 400)
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
}
