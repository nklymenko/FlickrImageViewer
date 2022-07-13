//
//  AppNavigationViewModel.swift
//  FlickrImageViewer
//
//  Created by Natalia Klymenko on 12.07.2022.
//

import Foundation
import Combine

class AppNavigationViewModel: ObservableObject {
	
	@Published var title : String
	@Published var images: [ImageItem] = []
	
	init(title: String, images: [ImageItem]) {
		self.title = title
		self.images = images
	}
}
