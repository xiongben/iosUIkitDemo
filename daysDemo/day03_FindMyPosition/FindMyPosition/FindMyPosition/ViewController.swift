//
//  ViewController.swift
//  FindMyPosition
//
//  Created by admin on 2022/7/27.
//

import UIKit
import CoreLocation
import SnapKit

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    let locationLabel = UILabel()
    let locationStrLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let bgImageView = UIImageView(frame: self.view.bounds)
        bgImageView.image = UIImage(named: "phoneBg.jpeg")
        self.view.addSubview(bgImageView)
        
        let blurEffect: UIBlurEffect = UIBlurEffect(style: .light)
        let blurView: UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        self.view.addSubview(blurView)
        
        locationManager.delegate = self
        
        locationLabel.frame = CGRect(x: 0, y: 50, width: self.view.bounds.width, height: 100)
        locationLabel.textAlignment = .center
        locationLabel.textColor = .white
        self.view.addSubview(locationLabel)
        
        locationStrLabel.frame = CGRect(x: 0, y: 100, width: self.view.bounds.width, height: 50)
        locationStrLabel.textAlignment = .center
        locationStrLabel.textColor = .white
        locationStrLabel.numberOfLines = 2
        self.view.addSubview(locationStrLabel)
        
        let findMyLocationBtn = UIButton(type: .custom)
        findMyLocationBtn.frame = CGRect(x: 50, y: self.view.bounds.height-80, width: self.view.bounds.width-100, height: 50)
        findMyLocationBtn.setTitle("Find My Position", for: .normal)
        findMyLocationBtn.setTitleColor(.white, for: .normal)
        findMyLocationBtn.addTarget(self, action: #selector(findMyLocation), for: .touchUpInside)
        self.view.addSubview(findMyLocationBtn)
    }
    
    @objc func findMyLocation() {
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locations: NSArray = locations as NSArray
        let currentLocation = locations.lastObject as! CLLocation
        let locationStr = "lat:\(currentLocation.coordinate.latitude) lng:\(currentLocation.coordinate.longitude)"
        locationLabel.text = locationStr
        reverseGeocode(location: currentLocation)
        locationManager.stopUpdatingLocation()
    }
    
    func reverseGeocode(location: CLLocation) {
        geocoder.reverseGeocodeLocation(location, completionHandler: { (placemarksArray, error) in
            if(error == nil) {
                if (error) == nil {
                    if placemarksArray!.count > 0 {
                        let placemark = placemarksArray?[0]
                        let address = "\(placemark?.subThoroughfare ?? ""), \(placemark?.thoroughfare ?? ""), \(placemark?.locality ?? ""), \(placemark?.subLocality ?? ""), \(placemark?.administrativeArea ?? ""), \(placemark?.postalCode ?? ""), \(placemark?.country ?? "")"
                        print("\(address)")
                        self.locationStrLabel.text = address
                    }
                }
            }
        })
    }
    

}

