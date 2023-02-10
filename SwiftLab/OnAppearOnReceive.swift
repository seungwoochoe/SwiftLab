//
//  OnAppearOnReceive.swift
//  SwiftLab
//
//  Created by Seungwoo Choe on 2023-02-11.
//

import SwiftUI
import Combine


// Q: .onAppear() vs .onReceive() - Which one is called first?
// A: The one attached earlier is called first.

// Compare the console results with the current state and after changing the order of the .onAppear() and .onReceive() modifiers.


struct OnAppearOnReceive: View {
    private let publisher = CurrentValueSubject<Bool, Never>(true)

    var body: some View {
        TestView(publisher: publisher.eraseToAnyPublisher())
    }
}

private struct TestView: View {
    let publisher: AnyPublisher<Bool, Never>

    @State private var received = false

    var body: some View {
        Text("")
            .onAppear {
                print("Appeared")
            }
            .onReceive(publisher) { output in
                print("Received")
                self.received = output
            }
    }
}
