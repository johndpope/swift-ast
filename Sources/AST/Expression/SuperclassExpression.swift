/*
   Copyright 2016 Ryuichi Saito, LLC and the Yanagiba project contributors

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

public enum SuperclassExpression {
  case method(String) // even though this includes functions and properties, but Swift PL reference calls it `self-method-expression`
  case `subscript`(ExpressionList)
  case initializer
}

extension SuperclassExpression : PrimaryExpression {
  public var textDescription: String {
    switch self {
    case .method(let name):
      return "super.\(name)"
    case .subscript(let exprs):
      return "super[\(exprs.textDescription)]"
    case .initializer:
      return "super.init"
    }
  }
}
