//
//  FlickrPhotos.swift
//  FlickrImageViewer
//
//  Created by Natalia Klymenko on 12.07.2022.
//

import Foundation

struct FlickrPhotos: Codable {
	
	let photo: [FlickrPhoto]
	let page: Int
	let pages: Int
	let perpage: Int
	let total: Int
}
