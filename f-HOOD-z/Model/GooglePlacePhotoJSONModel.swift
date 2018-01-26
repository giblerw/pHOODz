

import Foundation
import ObjectMapper

final class GooglePlacePhoto: Mappable, CustomStringConvertible {

  public fileprivate(set) var photoReference: String?

  required convenience init?(map: Map) {
    self.init()
  }

  func mapping(map: Map) {
    photoReference <- map["photo_reference"]
  }

  var description: String {
    return "\(toJSON())"
  }
}
