//
//  Item.swift
//  PhotoApp
//
//  Created by Mohammed Rokon Uddin on 10/6/24.
//

import SwiftUI

struct Item: Identifiable, Hashable {
  let id: String = UUID().uuidString
  let title: String
  let image: UIImage?
  let previewImage: UIImage?
  var appeared = false

  init(title: String, image: UIImage? = nil, previewImage: UIImage? = nil, appeared: Bool = false) {
    self.title = title
    self.image = image
    self.previewImage = previewImage
    self.appeared = appeared
  }

  static let mock: [Item] = [
    .init(title: "Turtle Rock", image: UIImage(named: "turtlerock")),
    .init(title: "Silver Salmon Creek", image: UIImage(named: "silversalmoncreek")),
    .init(title: "Chilkoot Trail", image: UIImage(named: "chilkoottrail")),
    .init(title: "St. Mary Lake", image: UIImage(named: "stmarylake")),
    .init(title: "Twin Lake", image: UIImage(named: "twinlake")),
    .init(title: "Lake McDonald", image: UIImage(named: "lakemcdonald")),
    .init(title: "Charley Rivers", image: UIImage(named: "charleyrivers")),
    .init(title: "Icy Bay", image: UIImage(named: "icybay")),
    .init(title: "Rainbow Lake", image: UIImage(named: "rainbowlake")),
    .init(title: "Hidden Lake", image: UIImage(named: "hiddenlake")),
    .init(title: "Chincoteague", image: UIImage(named: "chincoteague")),
    .init(title: "Lake Umbagog", image: UIImage(named: "umbagog")),
  ]
}
