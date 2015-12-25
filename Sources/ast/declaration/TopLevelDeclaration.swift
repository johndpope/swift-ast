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

public class TopLevelDeclaration: Declaration {
    private var _statements: [Statement]

    public override init() {
        _statements = [Statement]()

        super.init()
    }

    public func append(statement: Statement) {
        _statements.append(statement)
    }

    public var statements: [Statement] {
        return _statements
    }

    public override func inspect(indent: Int = 0) -> String {
        var inspectStr = "\(getIndentText(indent))(top-level-declaration".terminalColor(.Red)
        for statement in _statements {
            inspectStr += "\n\(statement.inspect(indent + 1))"
        }
        inspectStr += ")".terminalColor(.Red)
        return "\(inspectStr)"
    }
}