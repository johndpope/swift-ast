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

import Source
import AST
import Lexer

extension Parser {
  func parseFunctionResult() throws -> FunctionResult? {
    guard _lexer.match(.arrow) else { return nil }

    let attrs = try parseAttributes()
    let type = try parseType()
    return FunctionResult(attributes: attrs, type: type)
  }

  func parseThrowsKind() -> (ThrowsKind, SourceLocation?) {
    let endLocation = getEndLocation()
    switch _lexer.read([.throws, .rethrows]) {
    case .throws:
      return (.throwing, endLocation)
    case .rethrows:
      return (.rethrowing, endLocation)
    default:
      return (.nothrowing, nil)
    }
  }

  func parseVerifiedOperator(
    againstModifier kind: DeclarationModifier?
  ) -> Operator? {
    var verifiedOperator: Operator? = nil
    switch _lexer.look().kind {
    case .prefixOperator(let op):
      verifiedOperator =
        checkOperatorReservation(againstModifier: kind, op: op)
    case .binaryOperator(let op):
      verifiedOperator =
        checkOperatorReservation(againstModifier: kind, op: op)
    case .postfixOperator(let op):
      verifiedOperator =
        checkOperatorReservation(againstModifier: kind, op: op)
    case .postfixExclaim:
      verifiedOperator =
        checkOperatorReservation(againstModifier: kind, op: "!")
    case .rightChevron:
      verifiedOperator =
        checkOperatorReservation(againstModifier: kind, op: ">")
    case .prefixAmp:
      verifiedOperator =
        checkOperatorReservation(againstModifier: kind, op: "&")
    case .leftChevron:
      verifiedOperator =
        checkOperatorReservation(againstModifier: kind, op: "<")
    case .binaryQuestion, .postfixQuestion, .prefixQuestion:
      verifiedOperator =
        checkOperatorReservation(againstModifier: kind, op: "?")
    default:
      break
    }

    guard let op = verifiedOperator else { return nil }

    _lexer.advance()
    return op
  }
}
