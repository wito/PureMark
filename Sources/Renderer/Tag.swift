// Licensed under the MIT License, see PureMark/LICENSE

extension String {

  var propertyQuoted: String {
    return self.replacingOccurrences(of: "\"", with: "&quot;")
  }

  static func tag(string: String = "", with tag: String, attributes: [String:String] = [:]) -> String {
    let attributeString = attributes
      .map({
        return " \($0)=\"\($1.propertyQuoted)\""
      })
      .sorted()
      .joined()

    if (string.length > 0) {
      return "<\(tag)\(attributeString)>\(string)</\(tag)>"
    } else {
      return "<\(tag)\(attributeString) />"
    }
  }

  func tagged(with tag: String, attributes: [String:String] = [:]) -> String {
    return String.tag(string: self, with: tag, attributes: attributes)
  }
}
