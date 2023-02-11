//
//  DoesOnReceiveCalledEveryTimeTheViewStateChanges.swift
//  SwiftLab
//
//  Created by Seungwoo Choe on 2023-02-11.
//

import SwiftUI
import Combine


// Q: Does .onReceive() called every time the view state changes?
// A: No.
// Referenece: https://nalexn.github.io/stranger-things-swiftui-state > Phantom state updates

struct DoesOnReceiveCalledEveryTimeTheViewStateChanges: View {
    private let publisher = CurrentValueSubject<Bool, Never>(true)

    var body: some View {
        TestView(publisher: publisher.eraseToAnyPublisher())
    }
}

private struct TestView: View {
    let publisher: AnyPublisher<Bool, Never>

    @State private var count = 0

    var body: some View {
        Text("Q: Does .onReceive() called every time the view state changes?")
            .font(.title)
            .onReceive(publisher) { output in
                print("Received")
            }
            .padding()
        Text(count.description).font(.largeTitle)
        Button("Update the state") {
            count += 1
        }
    }
}
