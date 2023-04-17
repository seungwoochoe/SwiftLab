//
//  TextTimerPerformanceTest.swift
//  SwiftLab
//
//  Created by Seungwoo Choe on 2023-04-17.
//

import SwiftUI


// Unlike my expectation, CPU usage spikes 20-25% every second when using Text(_:style:).
// You can see that by running Product - Profile - Time Profiler.

struct TextTimerPerformanceTest: View {
    var body: some View {
        Text(Date(), style: .timer)
            .font(.largeTitle)
    }
}
