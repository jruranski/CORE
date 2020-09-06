//
//  MapView.swift
//  CORE
//
//  Created by Jakub Ruranski on 06/09/2020.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @Binding var cooridinates: MKCoordinateRegion
    var places = [MapPlace(latitude: 94.567343, longitude: 24.563467)]
    
    init(location: Binding<MKCoordinateRegion>) {
        self._cooridinates = location
        let center = location.center.wrappedValue
        self.places = [MapPlace(latitude: center.latitude, longitude: center.longitude)]
    }
    var body: some View {
        Map(coordinateRegion: $cooridinates, annotationItems: places) { place in
            MapPin(coordinate: place.coordinate, tint: .red)
        }
        .edgesIgnoringSafeArea(.all)
        .disabled(true)
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Preview")
    }
}



struct MapPlace: Identifiable {
    var id = UUID()
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
          CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
    
}
