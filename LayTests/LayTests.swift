//
//  LayTests.swift
//  LayTests
//
//  Created by Min Kim on 2/11/17.
//  Copyright © 2017 Min Kim. All rights reserved.
//

import XCTest
@testable import Lay

class LayTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }

    func testExample() {
        let results = [1, 2, 3, 4, 5, 6, 7, 8, 9].lay_linearPartition(k: 3)
    }

}
