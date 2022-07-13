//
//  FavoritesListViewModel.swift
//  FlickrImageViewer
//
//  Created by Natalia Klymenko on 12.07.2022.
//

import Foundation
import Combine

class FavoritesListViewModel: ObservableObject {
	
	@Published var navTitle : String
	@Published var favoriteImages: [ImageItem] = []
	var cancellables = Set<AnyCancellable>()
	
	init() {
		self.navTitle = "Favorites"
		addSubscribers()
	}
	
	func addSubscribers() {
		StorageManager.shared.$favoritesImages
			.sink { [weak self] (returnedFavoritesImages) in
				self?.favoriteImages = returnedFavoritesImages
			}
			.store(in: &cancellables)
	}
}
