//
//  SearchHistoryManager.swift
//  LocationPicker
//
//  Created by Almas Sapargali on 9/6/15.
//  Copyright (c) 2015 almassapargali. All rights reserved.
//

import UIKit
import MapKit

struct SearchHistoryManager {
	fileprivate let HistoryKey = "RecentLocationsKey"
	
	fileprivate var defaults = UserDefaults.standard
	
	func history() -> [Annotation] {
		let history = defaults.object(forKey: HistoryKey) as? [NSDictionary] ?? []
		return history.compactMap(Annotation.fromDefaultsDic)
	}
	
	func addToHistory(_ location: Annotation) {
		guard let dic = location.toDefaultsDic() else { return }
		
		var history  = defaults.object(forKey: HistoryKey) as? [NSDictionary] ?? []
		let historyNames = history.compactMap { $0[LocationDicKeys.name] as? String }
        let alreadyInHistory = location.name.flatMap(historyNames.contains) ?? false
		if !alreadyInHistory {
			history.insert(dic, at: 0)
			defaults.set(history, forKey: HistoryKey)
            defaults.synchronize()
		}
	}
}

struct LocationDicKeys {
	static let name = "Name"
	static let locationCoordinates = "LocationCoordinates"
	static let placemarkCoordinates = "PlacemarkCoordinates"
	static let placemarkAddressDic = "PlacemarkAddressDic"
}

struct CoordinateDicKeys {
	static let latitude = "Latitude"
	static let longitude = "Longitude"
}

extension CLLocationCoordinate2D {
	func toDefaultsDic() -> NSDictionary {
		return [CoordinateDicKeys.latitude: latitude, CoordinateDicKeys.longitude: longitude]
	}
	
	static func fromDefaultsDic(_ dic: NSDictionary) -> CLLocationCoordinate2D? {
		guard let latitude = dic[CoordinateDicKeys.latitude] as? NSNumber,
			let longitude = dic[CoordinateDicKeys.longitude] as? NSNumber else { return nil }
		return CLLocationCoordinate2D(latitude: latitude.doubleValue, longitude: longitude.doubleValue)
	}
}

extension Annotation {
	func toDefaultsDic() -> NSDictionary? {
		guard let addressDic = placemark.addressDictionary,
			let placemarkCoordinatesDic = placemark.location?.coordinate.toDefaultsDic()
			else { return nil }
		
		var dic: [String: AnyObject] = [
			LocationDicKeys.locationCoordinates: location.coordinate.toDefaultsDic(),
			LocationDicKeys.placemarkAddressDic: addressDic as AnyObject,
			LocationDicKeys.placemarkCoordinates: placemarkCoordinatesDic
		]
		if let name = name { dic[LocationDicKeys.name] = name as AnyObject? }
		return dic as NSDictionary?
	}
	
	class func fromDefaultsDic(_ dic: NSDictionary) -> Annotation? {
		guard let placemarkCoordinatesDic = dic[LocationDicKeys.placemarkCoordinates] as? NSDictionary,
			let placemarkCoordinates = CLLocationCoordinate2D.fromDefaultsDic(placemarkCoordinatesDic),
			let placemarkAddressDic = dic[LocationDicKeys.placemarkAddressDic] as? [String: AnyObject]
			else { return nil }
		
		let coordinatesDic = dic[LocationDicKeys.locationCoordinates] as? NSDictionary
		let coordinate = coordinatesDic.flatMap(CLLocationCoordinate2D.fromDefaultsDic)
		let location = coordinate.flatMap { CLLocation(latitude: $0.latitude, longitude: $0.longitude) }
		
		return Annotation(name: dic[LocationDicKeys.name] as? String,
			location: location, placemark: MKPlacemark(
                coordinate: placemarkCoordinates, addressDictionary: placemarkAddressDic))
	}
}
