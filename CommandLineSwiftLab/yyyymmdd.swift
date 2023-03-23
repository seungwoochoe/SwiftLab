//
//  yyyymmdd.swift
//  CommandLineSwiftLab
//
//  Created by Seungwoo Choe on 2023-03-23.
//

import Foundation


extension Date {
    var yyyymmdd1: String {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.timeZone = .current
        return String(dateFormatter.string(from: self).dropLast(15))
    }

    var yyyymmdd2: String {
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour], from: self)
        return dateComponents.year!.description + dateComponents.month!.description + dateComponents.day!.description
    }

    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}

struct YYYYMMDD {
    static func run() {
        let timesArray = [1, 2, 5, 10, 20, 30, 9999]

        for times in timesArray {
            print("Times: \(times)")
            let start1 = Date()
            
            for _ in 0...times {
                _ = start1.yyyymmdd1
            }
            print(String(format: "%.6f",  Date() - start1))


            let start2 = Date()
            for _ in 0...times {
                _ = start2.yyyymmdd2
            }
            print(String(format: "%.6f",  Date() - start2))
            print("")
        }
    }
}

/* Result
 Times: 1 >> ..?
 0.002217
 0.002484

 -------------------
 Times: 2
 0.000545
 0.000010

 Times: 5
 0.000886
 0.000014

 Times: 10
 0.001589
 0.000023

 Times: 20
 0.003014
 0.000041

 Times: 30
 0.004779
 0.000074

 Times: 9999
 1.438919
 0.018393
 */
