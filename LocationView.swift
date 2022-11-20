import CoreLocation
import SwiftUI

struct LocationSelectionView: View {
    private let locationFetcher = LocationFetcher()
    @State private var deviceLocation: String = ""
    private let locationVM = LocationViewModel.shared
    
    init() {
        locationFetcher.start()
    }

    var body: some View {
        VStack {
            Button("Read Location") {
                if let location = self.locationFetcher.lastKnownLocation {
                    
                    locationVM.getLocationFromLatLon(locationCoordinates: location, completion: {
                        location in
                        self.deviceLocation = location
                    })
                    
                } else {
                    deviceLocation = "Your location is unknown"
                }
            }
            Text(deviceLocation)
        }
    }
}


struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSelectionView()
    }
}
