//
//  ContentView.swift
//  FlickrImageViewer
//
//  Created by Natalia Klymenko on 12.07.2022.
//

import SwiftUI

struct MainView: View {
    
	var body: some View {
		TabView {
			ImageListView()
				.tabItem {
					Label("Photos", systemImage: "list.dash")
				}
			FavoritesListView()
				.tabItem {
					Label("Favorites", systemImage: "star.fill")
				}
		}
    }
}

struct MainView_Previews: PreviewProvider {
    
	static var previews: some View {
        MainView()
    }
}
