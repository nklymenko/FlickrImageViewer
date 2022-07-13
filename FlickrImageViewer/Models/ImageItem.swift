//
//  Photo.swift
//  FlickrImageViewer
//
//  Created by Natalia Klymenko on 12.07.2022.
//

import Foundation
import SwiftUI
import Combine

class ImageItem: Identifiable, ObservableObject {
	
	@Published var id: String
	@Published var title: String
	@Published var author: String
	@Published var urlPath: String
	
	@Published var isFavorite: Bool

	init(flickrPhoto: FlickrPhoto) {		
		self.id = flickrPhoto.id
		self.title = flickrPhoto.title
		self.author = flickrPhoto.ownerName
		self.urlPath = flickrPhoto.urlM
		self.isFavorite = false
	}
	
	init(dict: Dictionary<String, String>) {
		self.id = dict["id"]!
		self.title = dict["title"]!
		self.author = dict["author"]!
		self.urlPath = dict["urlPath"]!
		self.isFavorite = dict["isFavorite"] == "true" ? true : false
	}

	
	func intoDictionary() -> Dictionary<String, String> {
		let dict = [
			"id": id,
			"title": title,
			"author": author,
			"urlPath": urlPath,
			"isFavorite": isFavorite ? "true" : "false"
		];
		return dict
	}
}
