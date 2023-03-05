//
//  LocalizedStringKey.swift
//  SwiftLab
//
//  Created by Seungwoo Choe on 2023-03-06.
//

import SwiftUI

struct InlineNavigationTitle: ViewModifier {
    let title: LocalizedStringKey

    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
        #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

extension View {
    func inlineNavigationTitle(_ title: LocalizedStringKey = "") -> some View {
        modifier(InlineNavigationTitle(title: title))
    }
}


struct LocalizedStringKeyTest: View {
    var body: some View {
        NavigationStack {
            Text("LocalizedStringKeyTest")
                .inlineNavigationTitle("Will this string show up when exporting localizations?")
        }
    }
}

struct LocalizedStringKeyTest_Previews: PreviewProvider {
    static var previews: some View {
        LocalizedStringKeyTest()
    }
}
