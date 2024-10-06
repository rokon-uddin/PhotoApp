//
//  ContentView.swift
//  PhotoApp
//
//  Created by Mohammed Rokon Uddin on 10/6/24.
//

import SwiftUI

struct ContentView: View {
  var coordinator = UICoordinator()
  var body: some View {
    NavigationStack {
      Home()
        .environment(coordinator)
        .allowsTightening(coordinator.selectedItem == nil)
    }
    .overlay {
      Rectangle()
        .fill(.background)
        .ignoresSafeArea()
        .opacity(coordinator.animateView ? 1 : 0)
    }
    .overlay {
      if coordinator.selectedItem != nil {
        DetailView()
          .environment(coordinator)
          .allowsTightening(coordinator.showDetailView)
      }
    }
    .overlayPreferenceValue(HeroKey.self) { value in
      if let selectedItem = coordinator.selectedItem,
        let sourceAnchor = value[selectedItem.id + "SOURCE"],
        let destinationAnchor = value[selectedItem.id + "DESTINATION"]
      {
        HeroLayer(
          item: selectedItem,
          sourceAnchor: sourceAnchor,
          destinationAnchor: destinationAnchor
        )
        .environment(coordinator)
      }
    }
  }
}

#Preview {
  ContentView()
}
