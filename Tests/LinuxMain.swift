import XCTest

import fdbtestTests

var tests = [XCTestCaseEntry]()
tests += fdbtestTests.allTests()
XCTMain(tests)
