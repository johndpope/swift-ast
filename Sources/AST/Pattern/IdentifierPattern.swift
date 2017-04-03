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

public struct IdentifierPattern {
  public let identifier: Identifier
  public let typeAnnotation: TypeAnnotation?

  public init(identifier: Identifier, typeAnnotation: TypeAnnotation? = nil) {
    self.identifier = identifier
    self.typeAnnotation = typeAnnotation
  }
}

extension IdentifierPattern : Pattern {
  public var textDescription: String {
    return "\(identifier)\(typeAnnotation?.textDescription ?? "")"
  }
}
