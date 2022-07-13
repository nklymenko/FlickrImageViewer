//
//  URLCache.swift
//  FlickrImageViewer
//
//  Created by Natalia Klymenko on 13.07.2022.
//

import Foundation

extension URLCache {
	
	static private let allowedDiskCapacity = 10*1024*1024*1024  //10G. TODO: adapt this for device capacity, if possible/required
	static private let allowedMemCapacity = 512*1024*1024       //512M. Would fit approximately ~1500 images, if image is 300-400kb
	
	static let flickrURLCacheMemAndDisk = URLCache(memoryCapacity: allowedMemCapacity, diskCapacity: allowedDiskCapacity)
	static let flickrURLCacheMemOnly = URLCache(memoryCapacity: allowedMemCapacity, diskCapacity: 0)
	static let flickrURLCacheDiskOnly = URLCache(memoryCapacity: 0, diskCapacity: allowedDiskCapacity)
}
