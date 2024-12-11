//
//  DestinationRow.swift
//  TripMap
//
//  Created by Jiali Han on 11/22/24.
//

import SwiftUI
import SwiftData

struct DestinationRow: View {
    let destination: Destination
    let onDelete: () -> Void

    var body: some View {
        NavigationLink(value: destination) {
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                VStack(alignment: .leading) {
                    Text(destination.name)
                    Text("\(destination.placemarks.count) location\(destination.placemarks.count != 1 ? "s" : "")")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .swipeActions(edge: .trailing) {
            Button(role: .destructive) {
                onDelete()
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }
}
