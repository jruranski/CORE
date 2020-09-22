////
////  LocationPicker.swift
////  CORE
////
////  Created by Jakub Ruranski on 18/09/2020.
////
//
//import SwiftUI
//import MapKit
//
//
//struct LocationPicker: View {
//    @State var presented: Bool = false
//
//    func presentPicker() -> UIViewController {
//        let locationPicker = LocationPickerViewController()
//
//        // you can optionally set initial location
//        let loca = CLLocation(latitude: Double(sections[index].location.latitude ?? 35) , longitude: Double(sections[index].location.longtitude ?? 35) )
//        let initialLocation = Annotation(name: "\(sections[index].location.name ?? "Home")", location: loca, placemark: CLPlacemark())
//        locationPicker.location = initialLocation
//
//        // button placed on right bottom corner
//        locationPicker.showCurrentLocationButton = true // default: true
//
//        // default: navigation bar's `barTintColor` or `UIColor.white`
//        locationPicker.currentLocationButtonBackground = .blue
//
//        // ignored if initial location is given, shows that location instead
//        locationPicker.showCurrentLocationInitially = true // default: true
//
//        locationPicker.mapType = .standard // default: .Hybrid
//
//        // for searching, see `MKLocalSearchRequest`'s `region` property
//        locationPicker.useCurrentLocationAsHint = true // default: false
//
//        locationPicker.searchBarPlaceholder = "Search places" // default: "Search or enter an address"
//
//        locationPicker.searchHistoryLabel = "Previously searched" // default: "Search History"
//
//        // optional region distance to be used for creation region when user selects place from search results
//        locationPicker.resultRegionDistance = 500 // default: 600
//
//        return locationPicker
//    }
//
//
//    var body: some View {
//        Text("")
//            .sheet(isPresented: $presented) {
//
//            }
//    }
//}
//
//struct LocationPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationPicker()
//    }
//}
