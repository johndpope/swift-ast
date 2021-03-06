/*
   Copyright 2015-2017 Ryuichi Saito, LLC and the Yanagiba project contributors

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

import Foundation
import Frontend

var filePaths = CommandLine.arguments
filePaths.remove(at: 0)

let exitCode: Int32
if filePaths.first == "-dump-ast" {
  filePaths.remove(at: 0)
  exitCode = terminalMain(filePaths: filePaths, ttyType: .astDump)
} else if filePaths.first == "-print-ast" {
  filePaths.remove(at: 0)
  exitCode = terminalMain(filePaths: filePaths, ttyType: .astPrint)
} else if filePaths.first == "-diagnostics-only" {
  filePaths.remove(at: 0)
  exitCode = terminalMain(filePaths: filePaths, ttyType: .diagnosticsOnly)
} else {
  exitCode = terminalMain(filePaths: filePaths)
}

exit(exitCode)
