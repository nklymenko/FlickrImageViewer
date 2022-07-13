//
//  NetworkRoutes.swift
//  FlickrImageViewer
//
//  Created by Natalia Klymenko on 11.07.2022.
//

import Foundation

struct NetworkRoutes {
	
	static let basePath =  "https://flickr.com"
	static let flickrPhotos = "/services/rest/?method=flickr.people.getPublicPhotos&user_id=65789667%40N06&%20extras=url_m%2Cowner_name&format=json&nojsoncallback=1&api_key="
	
	static let publicKey = "56e779b053994c656ecbef2b4ecc9266"
	// Use your account Flickr key if need
	//static let publicKey = ""
}

