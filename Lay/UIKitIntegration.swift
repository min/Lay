//
//  UIKitIntegration.swift
//  Lay
//
//  Created by Min Kim on 2/11/17.
//  Copyright © 2017 Min Kim. All rights reserved.
//

import UIKit

public protocol Sizable {
    var size: CGSize { get }
}

extension CGSize: Weighable {
    public var weight: Int {
        return Int(floor(lay_aspectRatio * 100))
    }
}

extension CGSize: Sizable {
    public var size: CGSize {
        return self
    }
}

extension CGSize {
    public var lay_aspectRatio: CGFloat {
        return (width / height)
    }
}

extension Array where Element: Sizable {
    public func lay_justify(for width: CGFloat, preferredHeight: CGFloat = UIScreen.main.bounds.height / 4) -> [CGSize] {

        let summedWidth: CGFloat = reduce(0, { $0 + ($1.size.lay_aspectRatio * preferredHeight) })

        let rows: [[CGSize]] = map({ $0.size }).lay_linearPartition(k: Int(round(summedWidth / width)))

        var sizes: [CGSize] = []

        for row in rows {
            let summedRatios: CGFloat = row.reduce(0, { $0 + $1.lay_aspectRatio })

            var rowWidth: CGFloat = 0

            for (i, size) in row.enumerated() {
                var normalizedSize: CGSize = CGSize(
                    width: floor(width / summedRatios * size.lay_aspectRatio),
                    height: floor(width / summedRatios)
                )

                if i == row.count - 1 {
                    normalizedSize.width = width - rowWidth
                }

                rowWidth += normalizedSize.width

                sizes.append(normalizedSize)
            }
        }

        return sizes
    }
}
