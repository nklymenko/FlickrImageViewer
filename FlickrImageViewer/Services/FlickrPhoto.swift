//
//  FlickrPhoto.swift
//  FlickrImageViewer
//
//  Created by Natalia Klymenko on 12.07.2022.
//

import Foundation

struct FlickrPhoto: Codable {
	
	var id: String
	var owner: String
	var secret: String
	var server: String
	var farm: Int
	var title: String
	var isPublic: Int
	var isFriend: Int
	var isFamily: Int
	var ownerName: String
	var urlM: String
	var heightM: Int
	var widthM: Int
	
	enum CustomMappingKey: String, CodingKey {
	   case idPropKey = "id"
	   case ownerPropKey = "owner"
	   case secretPropKey = "secret"
	   case serverPropKey = "server"
	   case farmPropKey = "farm"
	   case titlePropKey = "title"
	   case isPublicPropKey = "ispublic"
	   case isFriendPropKey = "isfriend"
	   case isFamilyPropKey = "isfamily"
	   case ownerNamePropKey = "ownername"
	   case urlMPropKey = "url_m"
	   case heightMPropKey = "height_m"
	   case widthMPropKey = "width_m"
	}
	   
	init(from decoder: Decoder) throws {
	   let container = try decoder.container(keyedBy: CustomMappingKey.self)

	   id = try container.decode(String.self, forKey: .idPropKey)
	   owner = try container.decode(String.self, forKey: .ownerPropKey)
	   secret = try container.decode(String.self, forKey: .secretPropKey)
	   server = try container.decode(String.self, forKey: .serverPropKey)
	   farm = try container.decode(Int.self, forKey: .farmPropKey)
	   title = try container.decode(String.self, forKey: .titlePropKey)
	   isPublic = try container.decode(Int.self, forKey: .isPublicPropKey)
	   isFriend = try container.decode(Int.self, forKey: .isFriendPropKey)
	   isFamily = try container.decode(Int.self, forKey: .isFamilyPropKey)
	   ownerName = try container.decode(String.self, forKey: .ownerPropKey)
	   urlM = try container.decode(String.self, forKey: .urlMPropKey)
	   heightM = try container.decode(Int.self, forKey: .heightMPropKey)
	   widthM = try container.decode(Int.self, forKey: .widthMPropKey)
	}
}
