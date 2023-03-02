//
//  ViewController.swift
//  UserLocation
//
//  Created by Amby on 02/03/2023.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    private var locationManager: CLLocationManager?

    private let latLongLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemFill
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        latLongLabel.frame = CGRect(x: 20, y: view.bounds.height / 2 - 50, width: view.bounds.width - 40, height: 100)
        view.addSubview(latLongLabel)

        getUserLocation()
    }

    func getUserLocation() {
        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()

        locationManager?.delegate = self

        //locationManager?.allowsBackgroundLocationUpdates = true
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            latLongLabel.text = "Lat: \(location.coordinate.latitude) \nLng : \(location.coordinate.longitude)"
        }
    }

}

