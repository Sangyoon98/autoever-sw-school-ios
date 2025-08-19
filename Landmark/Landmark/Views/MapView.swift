//
//  MapView.swift
//  Landmark
//
//  Created by 채상윤 on 8/18/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        Map(position: .constant(.region(region)))
    }
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(
        latitude: 37.551_165, longitude: 126.988_161
    ))
}
