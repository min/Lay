//
//  Array+Lay.swift
//  Lay
//
//  Created by Min Kim on 2/11/17.
//  Copyright © 2017 Min Kim. All rights reserved.
//

import Foundation

extension Array where Element: Weighable {
    public func lay_linearPartition(k: Int) -> [[Element]] {
        if k <= 0 {
            return []
        }

        if k > count {
            return map({ [$0] })
        }

        var table: [[Int]] = (0..<count)
            .map({ _ in
                (0..<k).map({ _ in 0 })
            })

        var solution: [[Int]] = (0..<(count - 1))
            .map({ _ in
                (0..<(k - 1)).map({ _ in 0 })
            })

        for i in 0..<count {
            table[i][0] = self[i].weight + (i > 0 ? table[i-1][0] : 0)
        }

        for i in 0..<k {
            table[0][i] = self[0].weight
        }

        for i in 1..<count {
            for j in 1..<k {
                var results: [(weight: Int, index: Int)] = []

                for x in 0..<i {
                    let val1: Int = table[x][j-1]
                    let val2: Int = table[i][0] - table[x][0]

                    let max: Int = [val1, val2].max() ?? val1

                    results.append((weight: max, index: x))
                }
                var lowest: Int = .min

                var m: (weight: Int, index: Int)? = nil

                for result in results {
                    if lowest == .min || result.weight < lowest {
                        lowest = result.weight

                        m = result
                    }
                }
                if let m = m {
                    table[i][j] = m.weight
                    solution[i-1][j-1] = m.index
                }
            }
        }

        var n: Int = count - 1
        var k: Int = k - 2

        var answer: [[Element]] = []

        while k >= 0 && n >= 1 {
            var result: [Element] = []

            for i in (solution[n-1][k] + 1)..<(n + 1) {
                result.append(self[i])
            }

            answer.insert(contentsOf: [result], at: 0)

            n = solution[n-1][k]
            k = k - 1
        }

        var results: [[Element]] = [(0..<(n + 1)).map({ self[$0] })]

        results.append(contentsOf: answer)

        return results
    }
}
