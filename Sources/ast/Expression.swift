/*
   Copyright 2016 Ryuichi Saito, LLC

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

import util

public class Expression: Statement {
    public override func inspect(indent: Int = 0) -> String {
        return "\(getIndentText(indent))(expression)"
    }
}

public class BinaryExpression: Expression {
}

public class PrefixExpression: Expression {
}

public class PostfixExpression: Expression {
}

public class PrimaryExpression: PostfixExpression {
}

public typealias Identifier = String // TODO: identifier will have its own dedicated class when it becomes more complicated
public typealias Operator = String
