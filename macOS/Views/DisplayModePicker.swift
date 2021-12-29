//
//  DisplayModePicker.swift
//  Sarrafi (macOS)
//
//  Created by Armin on 12/22/21.
//

import SwiftUI

struct DisplayModePicker: View {
    @Binding var mode: SymbolView.ViewMode

    var body: some View {
        Picker("Display Mode", selection: $mode) {
            ForEach(SymbolView.ViewMode.allCases) { viewMode in
                viewMode.label
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

extension SymbolView.ViewMode {

    var labelContent: (name: String, systemImage: String) {
        switch self {
        case .table:
            return ("Table", "list.bullet")
        case .gallery:
            return ("Gallery", "sidebar.squares.leading")
        }
    }

    var label: some View {
        let content = labelContent
        return Label(content.name, systemImage: content.systemImage)
    }
}
