//
//  FlickrResponse.swift
//  FlickrResponse
//
//  Created by Natalia Klymenko on 12.07.2022.
//

import Foundation

struct FlickrResponse: Codable {
	
	let photos: FlickrPhotos
	let stat: String
}
