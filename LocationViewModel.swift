//
//  LocationViewModel.swift
//  TestPKCV
//
//  Created by Branislav Jovanović on 31.3.22..
//

import Foundation
import CoreLocation

class LocationViewModel: ObservableObject {
    static let shared = LocationViewModel()
    
    func getLocationFromLatLon(locationCoordinates: CLLocationCoordinate2D, completion:@escaping (String)->()) {

        let geocoder: CLGeocoder = CLGeocoder()
        let location: CLLocation = CLLocation(latitude: locationCoordinates.latitude, longitude: locationCoordinates.longitude)

        geocoder.reverseGeocodeLocation(location, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("Reverse geodcode fail: \(error!.localizedDescription)")
                }
                let pm = placemarks! as [CLPlacemark]
                if pm.count > 0 {
                    let pm = placemarks![0]
                    let continentName = pm.timeZone!.description.split(separator: "/").first!
                    let countryAndContinent = pm.country! + " - " + continentName
                    
                    print(countryAndContinent)
                    
                    completion(countryAndContinent)
              }
        })
    }
}
