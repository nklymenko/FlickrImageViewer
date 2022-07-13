//
//  ImageListViewModel.swift
//  FlickrImageViewer
//
//  Created by Natalia Klymenko on 12.07.2022.
//

import Foundation
import Combine

class ImageListViewModel: ObservableObject {
	
	@Published var navTitle : String
	@Published var imageItems = [ImageItem]()
	var cancellables = Set<AnyCancellable>()
	
	let dataStorage = StorageManager.shared

	init() {
		self.navTitle = "Photos"
		imageItems = dataStorage.allImages
		addSubscribers()
		downloadImages()
	}
		
	func downloadImages() {
		APIService.shared.downloadFlickrPhotos()
	}
	
	func addSubscribers() {
		APIService.shared.$flickrPhotos
			.sink { [weak self] (returnedflickrPhotos) in
				self?.imageItems = []
				for photo in returnedflickrPhotos  {
					let imageItem = ImageItem(flickrPhoto: photo)
					imageItem.isFavorite = StorageManager.shared.isInFavourites(image: imageItem)
					self?.imageItems.append(imageItem)
				}
			}
			.store(in: &cancellables)
	}
}
