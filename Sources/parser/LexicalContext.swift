/*
   Copyright 2015 Ryuichi Saito, LLC

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

class LexicalContext {
  private var _tokens = [Token]()

  func append(token: Token) {
    _tokens.append(token)
  }

  var tokens: [Token] {
    return _tokens
  }
}

extension LexicalContext: CustomStringConvertible {
  var description: String {
    var result = ""
    for token in _tokens {
      result += "\(token)"
    }
    return result
  }
}

extension LexicalContext {
  func inspect() -> String {
    var result = ""
    for token in _tokens {
      result += "\(token.inspect)"
    }
    return result
  }
}