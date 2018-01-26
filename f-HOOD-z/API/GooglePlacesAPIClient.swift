

import Alamofire
import AlamofireObjectMapper
import CoreLocation
import Foundation

// pass the found places back via delegate
protocol GooglePlacesAPIClientDelegate: NSObjectProtocol {
  func googlePlacesAPIClient(_ client: GooglePlacesAPIClient, didUpdate places: [GooglePlaceJSONModel])
}

final class GooglePlacesAPIClient: NSObject {

  static let instance = GooglePlacesAPIClient()

  private override init() {
    lastSearchLocation = CLLocation.init()
    super.init()
  }

  class func shared() -> GooglePlacesAPIClient {
    return instance
  }

  weak var delegate: GooglePlacesAPIClientDelegate?

  // Google API key
  let apiKey = "AIzaSyDD6BSQdEhdsn0BAxn9D4eldKJcbGOBYNE"

  private let apiBaseURLFragment = "https://maps.googleapis.com/maps/api/place/"

  // for nearby searches
  private let nearbyURLFragment = "nearbysearch/json?key=%@&location=%f,%f&rankby=distance&type=restaurant"

  // return the 20 nearest places with restaurant type
  private var nearbyURLFormat: String {
    return apiBaseURLFragment + nearbyURLFragment
  }

  // 300px300px images requested for @3x screens. Ideally this would be configurable
  private var photoURLFormat: String {
    return apiBaseURLFragment + "photo?key=%@&photoreference=%@&maxwidth=300&maxheight=300"
  }

  private var lastSearchLocation: CLLocation

  // MARK: - Places HTTP API

  // TODO: refactor so that only 1 function is needed to get locations
  // get 20 nearby locations, sorted by distance
  // 20 is the number returned by Google without using paging
  func fetchNearbyRestaurantsFor(_ location: CLLocation) {
    lastSearchLocation = location
    let urlString = String(format: nearbyURLFormat,
                           apiKey,
                           location.coordinate.latitude,
                           location.coordinate.longitude)
    print(urlString)
    Alamofire.request(urlString).responseObject { (response: DataResponse<GooglePlacesSearchResponseJSONModel>) in
      let searchResponse = response.result.value
        
      if let searchResponse = searchResponse, self.delegate != nil {
        let places = searchResponse.places!
        
        for place in places {
          place.setDistanceFrom(self.lastSearchLocation)
        }
        self.delegate!.googlePlacesAPIClient(self, didUpdate: places)
      }
    }
  }

  func urlForPhoto(reference: String) -> String {
    return String(format: photoURLFormat, apiKey, reference)
  }
}
