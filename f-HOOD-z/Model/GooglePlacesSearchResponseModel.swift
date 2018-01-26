import Foundation
import ObjectMapper

final class GooglePlacesSearchResponseJSONModel: Mappable, CustomStringConvertible {

  public fileprivate(set) var places: [GooglePlaceJSONModel]?

  required convenience init?(map: Map) {
    self.init()
  }

  func mapping(map: Map) {
    places <- map["results"]
  }

  var description: String {
    return "\(toJSON())"
  }

}
