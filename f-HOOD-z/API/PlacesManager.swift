
import CoreLocation
import Foundation

typealias PlacesErrorType = (title: String, body: String)

/*
 * Delegate for PlacesManager. In a large app with many parts requiring access to this data delegate
 * wouldn't be suitable, use notification center instead
 *
 */
protocol PlacesManagerDelegate: NSObjectProtocol {
  func placesManager(_ manager: PlacesManager, didUpdate googlePlaces: [GooglePlaceJSONModel])
  func placesManager(_ manager: PlacesManager, didEncounterError error: PlacesErrorType)
}

final class PlacesManager: NSObject, CLLocationManagerDelegate, GooglePlacesAPIClientDelegate {

  // MARK: - Singleton
  static let instance = PlacesManager()

  private override init() {
    super.init()
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    locationManager.distanceFilter = 50.0
    placesAPIClient.delegate = self
  }

  class func shared() -> PlacesManager {
    return instance
  }

  // MARK: - Properties
  weak var delegate: PlacesManagerDelegate?

  private let locationManager = CLLocationManager()
  private let placesAPIClient = GooglePlacesAPIClient.shared()

  var userLocation: CLLocation?

  // MARK: - Place retrieval

  func refreshPlaces() {
    locationManager.startUpdatingLocation()
  }

  // MARK: - CLLocationManagerDelegate
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    // TODO: handle the error
  }

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    userLocation = locations.first!
    locationManager.stopUpdatingLocation()
    placesAPIClient.fetchNearbyRestaurantsFor(userLocation!)
    // location manager is just using requestLocation so this will be called deliberately
  }

  func locationManager(_ manager: CLLocationManager,
                       didChangeAuthorization status: CLAuthorizationStatus) {
    checkLocationAuth(status: status)
  }

  func checkLocationAuth(status: CLAuthorizationStatus) {
    switch status {
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
    case .authorizedWhenInUse:
      locationManager.startUpdatingLocation()
    case .authorizedAlways:
      locationManager.startUpdatingLocation()
    case .restricted:
      warnAboutLocationSettings()
    case .denied:
      warnAboutLocationSettings()
    }
  }

  func warnAboutLocationSettings() {
    assert(delegate != nil, "\(#function) :: Delegate is nil")
    if delegate != nil {
      let error: PlacesErrorType = (
        title: "Location Services Disabled",
        body: "Please enable location services for Restaurants in Settings."
      )
      locationManager.requestWhenInUseAuthorization()
      delegate!.placesManager(self, didEncounterError: error)
    }
  }

  // MARK: - Google Places Client Delegate

  func googlePlacesAPIClient(_ client: GooglePlacesAPIClient, didUpdate places: [GooglePlaceJSONModel]) {
    assert(delegate != nil, "\(#function) :: Delegate is nil")
    if delegate != nil {
      delegate!.placesManager(self, didUpdate: places)
    }
  }
}
