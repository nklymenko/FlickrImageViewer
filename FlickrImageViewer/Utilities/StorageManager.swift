//
//  StorageManager.swift
//  FlickrImageViewer
//
//  Created by Natalia Klymenko on 12.07.2022.
//

import Foundation
import Combine


class StorageManager {

	private let defaultsFavoritesKey = "Favorites"
	private let defaultsImagesKey = "Images"
	
	@Published var favoritesImages: [ImageItem] = []
	@Published var allImages: [ImageItem] = []
	
	static let shared = StorageManager()
	private init() {
		favoritesImages = getFavoritesFromDefaults()
		allImages = getAllImagesFromDefaults()
	}

	// MARK: -
	
	func saveToAllImages(image: ImageItem?) {
		guard let imageItem = image else {
			return
		}

		self.allImages.append(imageItem) // to store in the memory
		
		self.saveInDefaultsAllImages(image: imageItem) // to store into defaults
	}
	
	func saveToFavorites(image: ImageItem?) {
		guard let imageItem = image else {
			return
		}

		self.favoritesImages.append(imageItem) // to store in the memory
		self.saveInDefaultsFavorites(image: imageItem) // to store into defaults
	}
	
	func removeFromFavorites(image: ImageItem?) {
		guard let imageItem = image else {
			return
		}
		
		var items = self.favoritesImages
		
		let index = self.getItemFromItemArray(items: items, uniqueName: imageItem.urlPath)
		if ((index > -1) && (index < items.count)) {
			items.remove(at: index)
		}
		self.favoritesImages = items
		
		self.removeFromDefaultsfavorites(image: imageItem)
	}
	
	func isInFavourites(image: ImageItem) -> Bool {
		let index = self.getItemFromItemArray(items: self.favoritesImages, uniqueName: image.urlPath)
		return (index != -1)
	}
	
	// MARK: - Private
	
	private func getItemFromItemArray(items: [ImageItem], uniqueName: String) -> Int {
		var index = -1
		if let i = items.firstIndex(where: { $0.urlPath == uniqueName }) {
			index = i
			return index
		}
		return index
	}
	
	private func saveInDefaultsFavorites(image: ImageItem?) {
		saveInDefaults(image: image, key: defaultsFavoritesKey)
	}
	
	/// TODO: add to Defaults one by one takes too long
	/// We need to think about better aproach to store all image items
	private func saveInDefaultsAllImages(image: ImageItem?) {
		saveInDefaults(image: image, key: defaultsImagesKey)
	}
	
	private func saveInDefaults(image: ImageItem?, key: String) {
		guard let imageItem = image else {
			return
		}
		
		let dict = imageItem.intoDictionary()
		
		let defaults = UserDefaults.standard
		let arrayOfDict = defaults.object(forKey: key) as? [Dictionary<String, String>] // array of dictionaries
		
		var images : [Dictionary<String, String>] = []
		if var images = arrayOfDict {
			images.append(dict)
			defaults.set(images, forKey: key)
		} else {
			images.append(dict)
			defaults.set(images, forKey: key)
		}
		defaults.synchronize()
	}
	
	private func removeFromDefaultsfavorites(image: ImageItem?) {
		guard let imageItem = image else {
			return
		}
		
		let defaults = UserDefaults.standard
		let defaultsFavorites = defaults.object(forKey: defaultsFavoritesKey) as? [Dictionary<String, String>] // array of dictionaries
		
		if var favorites = defaultsFavorites {
			var index = -1
			if let i = favorites.firstIndex(where: { $0["urlPath"] == imageItem.urlPath }) {
				index = i
			}
			
			if ((index > -1) && (index < favorites.count)) {
				favorites.remove(at: index)
			}
			defaults.set(favorites, forKey: defaultsFavoritesKey)
			defaults.synchronize()
		}
	}
	
	private func getFavoritesFromDefaults() -> [ImageItem] {
		return getImagesFromDefault(key: defaultsFavoritesKey)
	}
	
	private func getAllImagesFromDefaults() ->  [ImageItem] {
		return getImagesFromDefault(key: defaultsImagesKey)
	}
	
	private func getImagesFromDefault(key: String)  ->  [ImageItem] {
		var imageItems : [ImageItem] = []
		let defaults = UserDefaults.standard
		let arrayOfDict = defaults.object(forKey: key) as? [Dictionary<String, String>]
		
		if let favorites = arrayOfDict {
			for item in favorites {
				let imageItem = ImageItem(dict:item)
				imageItems.append(imageItem)
			}
		}

		return imageItems
	}
}
