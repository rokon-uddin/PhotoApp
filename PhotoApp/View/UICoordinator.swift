//
//  UICoordinator.swift
//  PhotoApp
//
//  Created by Mohammed Rokon Uddin on 10/6/24.
//

import SwiftUI

@Observable
class UICoordinator {
  var items: [Item] = Item.mock.compactMap {
    Item(title: $0.title, image: $0.image, previewImage: $0.image)
  }

  var selectedItem: Item?
  var animateView = false
  var showDetailView = false
  var detailScrollPosition: String?

  func didDetailPageChange() {
    if let updatedItem = items.first(where: { $0.id == detailScrollPosition }) {
      selectedItem = updatedItem
    }
  }

  func toggleView(show: Bool) {
    if show {
      detailScrollPosition = selectedItem?.id
      withAnimation(.easeInOut(duration: 2), completionCriteria: .removed) {
        animateView = true
      } completion: {
        self.showDetailView = true
      }
    } else {
      showDetailView = false
      withAnimation(.easeInOut(duration: 2), completionCriteria: .removed) {
        animateView = false
      } completion: {
        self.resetAnimationProperties()
      }
    }
  }

  private func resetAnimationProperties() {
    selectedItem = nil
    detailScrollPosition = nil
  }
}
