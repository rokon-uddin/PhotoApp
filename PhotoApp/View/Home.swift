//
//  Home.swift
//  PhotoApp
//
//  Created by Mohammed Rokon Uddin on 10/6/24.
//

import SwiftUI

struct Home: View {
  @Environment(UICoordinator.self) private var coordinator
  var body: some View {
    ScrollView(.vertical) {
      LazyVGrid(columns: Array(repeating: GridItem(spacing: 1), count: 3), spacing: 1) {
        ForEach(coordinator.items) { item in
          GridImageView(item)
            .onTapGesture {
              coordinator.selectedItem = item
            }
        }
      }
    }
    .navigationTitle("Recents")
  }

  @ViewBuilder
  func GridImageView(_ item: Item) -> some View {
    GeometryReader {
      let size = $0.size

      Rectangle()
        .fill(.clear)
        .anchorPreference(key: HeroKey.self, value: .bounds) { anchor in
          return [item.id + "SOURCE": anchor]
        }

      if let previewImage = item.previewImage {
        Image(uiImage: previewImage)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: size.width, height: size.height)
          .clipped()
          .opacity(coordinator.selectedItem?.id == item.id ? 0 : 1)
      }
    }
    .frame(height: 130)
    .contentShape(.rect)
  }
}

#Preview {
  ContentView()
}
