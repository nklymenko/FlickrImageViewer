//
//  ImageListView.swift
//  FlickrImageViewer
//
//  Created by Natalia Klymenko on 12.07.2022.
//

import SwiftUI

struct ImageListView: View {
	
	@StateObject var viewModel = ImageListViewModel()
	
    var body: some View {
		
		AppNavigationView(viewModel: AppNavigationViewModel(title: viewModel.navTitle, images: viewModel.imageItems))
	}
	
	init() {
		UINavigationBar.appearance().backgroundColor = AppColorScheme.navBarBackgroundColor
	}
 }

struct ImageList_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			ImageListView()
		}
    }
}
