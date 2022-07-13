//
//  ImageListCell.swift
//  FlickrImageViewer
//
//  Created by Natalia Klymenko on 12.07.2022.
//

import SwiftUI
import CachedAsyncImage

struct ImageView : View {
	
	@ObservedObject var viewModel = ImageViewModel()
	@ObservedObject var imageItem: ImageItem
	
	var body: some View {
				
		CachedAsyncImage(url: URL(string: imageItem.urlPath), urlCache: .flickrURLCacheMemAndDisk) { image in
			if let image = image {
				image.resizable()
					.frame(height: 250)
		   }
		}
		placeholder: {
			HStack {
				Image(systemName: "photo")
					.imageScale(.medium)
					.foregroundColor(.gray)
					.frame(width: 150, height: 100, alignment: .center)
				ProgressView()
			}
		}
		.listRowBackground(Color.clear)
		.overlay(
			VStack(alignment: .leading) {
				Text(imageItem.title)
					.font(.body)
					.bold()
				Text(imageItem.author)
					.font(.caption)
			}
			.foregroundColor(.white)
			.padding(5)
			,
			alignment: .bottomLeading
		)
		.overlay(
			VStack() {
				Button(action: {
					imageItem.isFavorite = !imageItem.isFavorite
					if (imageItem.isFavorite) {
						viewModel.saveToFavorites(image: imageItem)
					}
					else {
						viewModel.removeFromFavorites(image: imageItem)
					}
				}) {
					Image(systemName: (imageItem.isFavorite) ? "star.circle.fill" : "star.circle")
				}
				.foregroundColor(Color.white)
				.offset(x: -10, y: 10)
			},
			alignment: .topTrailing)
	}
}
