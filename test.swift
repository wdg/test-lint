import Foundation
import CoreLocation

class Geocoder: ObservableObject {
    /// Placemark
    @Published public var placeMark: CLPlacemark?
    /// Location
    @Published public var location: CLLocation?
    /// The name of the placemark.
    @Published public var name: String?
    /// The abbreviated country or region name.
    @Published public var iso: String?
    /// The name of the country or region associated with the placemark.
    @Published public var country: String?
    /// The postal code associated with the placemark.
    @Published public var postalCode: String?
    /// The state or province associated with the placemark.
    @Published public var state: String?
    /// Additional administrative area information for the placemark.
    @Published public var subState: String?
    /// The city associated with the placemark.
    @Published public var city: String?
    /// Additional city-level information for the placemark.
    @Published public var subCity: String?
    /// The street address associated with the placemark.
    @Published public var street: String?
    /// Additional street-level information for the placemark.
    @Published public var subStreet: String?
    /// The geographic region associated with the placemark.
    @Published public var region: CLRegion?
    /// The time zone associated with the placemark.
    @Published public var timeZone: TimeZone?
    /// The name of the inland water body associated with the placemark.
    @Published public var inlandWater: String?
    /// The name of the ocean associated with the placemark.
    @Published public var ocean: String?
    /// The relevant areas of interest associated with the placemark.
    @Published public var areasOfInterest: [String]?

    private let geoCoder = CLGeocoder()

    init () { }
    func update (to location: CLLocation) {
        geoCoder.reverseGeocodeLocation(
            location,
            completionHandler: { (placemarks, _) -> Void in
                if let placeMark = placemarks?[0] {
                    self.placeMark = placeMark
                    self.location = placeMark.location
                    self.name = placeMark.name
                    self.iso = placeMark.isoCountryCode
                    self.country = placeMark.country
                    self.postalCode = placeMark.postalCode
                    self.state = placeMark.administrativeArea
                    self.subState = placeMark.subAdministrativeArea
                    self.city = placeMark.locality
                    self.subCity = placeMark.subLocality
                    self.street = placeMark.thoroughfare
                    self.subStreet = placeMark.subThoroughfare
                    self.region = placeMark.region
                    self.timeZone = placeMark.timeZone
                    self.inlandWater = placeMark.inlandWater
                    self.ocean = placeMark.ocean
                    self.areasOfInterest = placeMark.areasOfInterest
                    self.objectWillChange.send()
                }
            }
        )
    }
}
