//
//  Weighable.swift
//  Lay
//
//  Created by Min Kim on 2/11/17.
//  Copyright © 2017 Min Kim. All rights reserved.
//

import Foundation

public protocol Weighable {
    var weight: Int { get }
}

extension Int: Weighable {
    public var weight: Int { return self }
}
