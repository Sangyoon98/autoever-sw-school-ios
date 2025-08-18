//
//  MapView.swift
//  Landmark
//
//  Created by 채상윤 on 8/18/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map(initialPosition: .region(region))
    }
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.551_165, longitude: 126.988_161),
            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    }
}

#Preview {
    MapView()
}
