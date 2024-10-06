//
//  HeroLayer.swift
//  PhotoApp
//
//  Created by Mohammed Rokon Uddin on 10/6/24.
//

import SwiftUI

struct HeroLayer: View {
  @Environment(UICoordinator.self) private var coordinator
  var item: Item
  let sourceAnchor: Anchor<CGRect>
  let destinationAnchor: Anchor<CGRect>
  var body: some View {
    GeometryReader { proxy in
      let sourceReact = proxy[sourceAnchor]
      let destinationReact = proxy[destinationAnchor]
      let animateView = coordinator.animateView

      let width = animateView ? destinationReact.width : sourceReact.width
      let height = animateView ? destinationReact.height : sourceReact.height

      let minX = animateView ? destinationReact.minX : sourceReact.minX
      let minY = animateView ? destinationReact.minY : sourceReact.minY

      let viewSize: CGSize = .init(width: width, height: height)
      let viewPosition: CGSize = .init(width: minX, height: minY)

      if let image = item.image, !coordinator.showDetailView {
        Image(uiImage: image)
          .resizable()
          .aspectRatio(contentMode: animateView ? .fit : .fill)
          .frame(width: viewSize.width, height: viewSize.height)
          .clipped()
          .offset(viewPosition)
          .transition(.identity)
      }
    }
  }
}

#Preview {
  ContentView()
}
