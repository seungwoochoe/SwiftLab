//
//  LocalizedStringKey.swift
//  SwiftLab
//
//  Created by Seungwoo Choe on 2023-03-06.
//

import SwiftUI

struct InlineNavigationTitle: ViewModifier {
    let title: Text

    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
        #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

extension View {
    func inlineNavigationTitle(_ title: LocalizedStringKey) -> some View {
        modifier(InlineNavigationTitle(title: Text(title)))
    }

    func inlineNavigationTitle(verbatim: any StringProtocol) -> some View {
        modifier(InlineNavigationTitle(title: Text(verbatim)))
    }
}


struct LocalizedStringKeyTest: View {
    let someBool = true

    var body: some View {
        NavigationStack {
            Text("LocalizedStringKeyTest")
                .inlineNavigationTitle("Should be localizable")
//                .inlineNavigationTitle(verbatim: "No need to be localized")

            Text(someBool ? "Should be localizable 2" : "Should be localizable 3")
        }
    }
}

struct LocalizedStringKeyTest_Previews: PreviewProvider {
    static var previews: some View {
        LocalizedStringKeyTest()
    }
}
