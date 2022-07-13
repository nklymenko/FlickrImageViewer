//
//  View.swift
//  FlickrImageViewer
//
//  Created by Natalia Klymenko on 10.07.2022.
//

import Foundation
import SwiftUI

extension View {
  func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View {
	self.modifier(NavigationBarColor(backgroundColor: backgroundColor, tintColor: tintColor))
  }
}
