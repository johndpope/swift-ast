/*
   Copyright 2016-2017 Ryuichi Saito, LLC and the Yanagiba project contributors

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/

public struct TuplePattern {
  public enum Element {
    case pattern(Pattern)
    case namedPattern(Identifier, Pattern)
  }

  public let elementList: [Element]
  public let typeAnnotation: TypeAnnotation?

  public init(
    elementList: [Element] = [], typeAnnotation: TypeAnnotation? = nil
  ) {
    self.elementList = elementList
    self.typeAnnotation = typeAnnotation
  }
}

extension TuplePattern.Element {
  public var textDescription: String {
    switch self {
    case .pattern(let pattern):
      return pattern.textDescription
    case let .namedPattern(name, pattern):
      return "\(name): \(pattern.textDescription)"
    }
  }
}

extension TuplePattern : Pattern {
  public var textDescription: String {
    let elemStr = elementList.map({ $0.textDescription }).joined(separator: ", ")
    let annotationStr = typeAnnotation?.textDescription ?? ""
    return "(\(elemStr))\(annotationStr)"
  }
}
