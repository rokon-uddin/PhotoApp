//
//  DetailView.swift
//  PhotoApp
//
//  Created by Mohammed Rokon Uddin on 10/6/24.
//

import SwiftUI

struct DetailView: View {
  @Environment(UICoordinator.self) private var coordinator
  var body: some View {

    VStack(spacing: 0) {
      NavigationBar()

      GeometryReader {
        let size = $0.size
        ScrollView(.horizontal) {
          LazyHStack(spacing: 0) {
            ForEach(coordinator.items) { item in
              ImageView(item, size: size)
            }
          }
          .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .scrollPosition(
          id: .init(
            get: {
              return coordinator.detailScrollPosition
            },
            set: {
              coordinator.detailScrollPosition = $0
            })
        )
        .onChange(
          of: coordinator.detailScrollPosition,
          { oldValue, newValue in
            coordinator.didDetailPageChange()
          }
        )
        .background {
          if let selectedItem = coordinator.selectedItem {
            Rectangle()
              .fill(.clear)
              .anchorPreference(key: HeroKey.self, value: .bounds) { anchor in
                return [selectedItem.id + "DESTINATION": anchor]
              }
          }
        }
      }

    }
    .opacity(coordinator.showDetailView ? 1 : 0)
    .onAppear {
      coordinator.toggleView(show: true)
    }
  }

  @ViewBuilder
  func NavigationBar() -> some View {
    HStack {
      Button {
        coordinator.toggleView(show: false)
      } label: {
        HStack(spacing: 2) {
          Image(systemName: "chevron.left")
            .font(.title3)
          Text("Back")
        }
      }

      Spacer(minLength: 0)

      Button {

      } label: {
        Image(systemName: "ellipsis")
          .padding(10)
          .background(.bar, in: .circle)
      }
    }
    .padding([.top, .horizontal], 16)
    .padding(.bottom, 10)
    .background(.ultraThinMaterial)
    .offset(y: coordinator.showDetailView ? 0 : -120)
    .animation(.easeInOut(duration: 0.15), value: coordinator.showDetailView)
  }

  @ViewBuilder
  func ImageView(_ item: Item, size: CGSize) -> some View {
    if let image = item.image {
      Image(uiImage: image)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: size.width, height: size.height)
        .clipped()
        .contentShape(.rect)
    }
  }
}

#Preview {
  ContentView()
}
