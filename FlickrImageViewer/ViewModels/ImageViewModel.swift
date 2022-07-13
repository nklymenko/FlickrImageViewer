//
//  ImageViewModel.swift
//  FlickrImageViewer
//
//  Created by Natalia Klymenko on 12.07.2022.
//

import Foundation
import SwiftUI

class ImageViewModel : ObservableObject {
			
	func saveToFavorites(image: ImageItem?) {
		StorageManager.shared.saveToFavorites(image: image)
	}
	
	func removeFromFavorites(image: ImageItem?) {
		StorageManager.shared.removeFromFavorites(image: image)
	}
}
