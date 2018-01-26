
import CoreLocation
import Foundation
import ObjectMapper

final class GooglePlaceJSONModel: Mappable, CustomStringConvertible {

  public fileprivate(set) var placeId: String?
  public fileprivate(set) var reference: String?
  public fileprivate(set) var name: String?
  public fileprivate(set) var latitude: Double?
  public fileprivate(set) var longitude: Double?
  public fileprivate(set) var photos: [GooglePlacePhoto]?
  public fileprivate(set) var address: String?

  var distance: CLLocationDistance = 0.0

  required convenience init?(map: Map) {
    self.init()
  }

  func mapping(map: Map) {
    name <- map["name"]
    placeId <- map["place_id"]
    reference <- map["reference"]
    latitude <- map["geometry.location.lat"]
    longitude <- map["geometry.location.lng"]
    photos <- map["photos"]
    address <- map["vicinity"]
  }

  var description: String {
    return "\(toJSON())"
  }

  var headlineCellData: HeadlineCellData {
    let distanceKMString = String(format: "%.02f KM", distance / 1000)
    return (
      imageURL: photoThumbnailURL,
      title: name!,
      subtitle: distanceKMString,
      body: address!
    )
  }

  var photoThumbnailURL: String {
    if let photos = photos, photos.count > 0 {
      let thumbnailPhoto: GooglePlacePhoto = photos[0]
      return GooglePlacesAPIClient.shared().urlForPhoto(reference: thumbnailPhoto.photoReference!)

    } else {
      return String()
    }
  }

  func setDistanceFrom(_ location: CLLocation) {
    let placeLocation = CLLocation(latitude: latitude!, longitude: longitude!)
    distance = location.distance(from: placeLocation)
  }

}
