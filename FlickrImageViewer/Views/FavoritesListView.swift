//
//  FavoriteListView.swift
//  FlickrImageViewer
//
//  Created by Natalia Klymenko on 12.07.2022.
//

import SwiftUI

struct FavoritesListView: View {
	
	@StateObject var viewModel = FavoritesListViewModel()
	let appearance: UITabBarAppearance = UITabBarAppearance()
	
    var body: some View {
		
		AppNavigationView(viewModel: AppNavigationViewModel(title: viewModel.navTitle, images: viewModel.favoriteImages))
	}
	
	init() {
		UINavigationBar.appearance().backgroundColor = AppColorScheme.navBarBackgroundColor
		UITabBar.appearance().scrollEdgeAppearance = appearance
	}
}

struct FavoritesList_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			FavoritesListView()
		}
    }
}
