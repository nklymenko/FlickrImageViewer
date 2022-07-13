//
//  APIService.swift
//  FlickrImageViewer
//
//  Created by Natalia Klymenko on 12.07.2022.
//

import Foundation
import Combine

class APIService {
	
	@Published var flickrPhotos: [FlickrPhoto] = []
	var cancellables = Set<AnyCancellable>()

	static let shared = APIService()
	private init() {}
		
	func fetchFlickrResponse(completionHandler: @escaping (FlickrResponse?) -> Void) {
		guard let url = URL(string: NetworkRoutes.basePath + "/" + NetworkRoutes.flickrPhotos + NetworkRoutes.publicKey) else { return }
		
		URLSession.shared.dataTaskPublisher(for: url)
			.subscribe(on: DispatchQueue.global())
			.receive(on: DispatchQueue.main)
			.tryMap(handleOutput)
			.decode(type: FlickrResponse.self, decoder: JSONDecoder())
			.sink { (completion) in
				switch completion {
				case .finished:
					break
				case .failure(let error):
					print("Error on fetching data. \(error)")
				}
			} receiveValue: { (returnedFlickrRsponse) in
				completionHandler(returnedFlickrRsponse)
			}
			.store(in: &cancellables)
	}
	
	private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws ->Data {
		guard
			let response = output.response as? HTTPURLResponse,
			response.statusCode >= 200 && response.statusCode < 300 else {
				throw URLError(.badServerResponse)
			}
		return output.data
	}
	
	func downloadFlickrPhotos() {
		self.fetchFlickrResponse { flickrResponse in
			if let flickrResponse = flickrResponse {
				for photo in flickrResponse.photos.photo  {
					self.flickrPhotos.append(photo)
				}
			}
			else {
				print("Error on response")
			}
		}
	}

}
