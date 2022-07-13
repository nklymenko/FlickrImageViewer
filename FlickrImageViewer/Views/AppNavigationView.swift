//
//  AppNavigationView.swift
//  FlickrImageViewer
//
//  Created by Natalia Klymenko on 12.07.2022.
//

import SwiftUI

struct AppNavigationView: View {
	
	@ObservedObject var viewModel : AppNavigationViewModel

	var body: some View {
		NavigationView {
			LinearGradient(gradient: Gradient(colors: [AppColorScheme.backgroundColor, AppColorScheme.backgroundColor.opacity(0.45)]), startPoint: UnitPoint(x:0.0, y:0.25), endPoint: .bottomLeading)
						.edgesIgnoringSafeArea(.vertical)
						.overlay(
							
							VStack(alignment: .leading) {

								if (viewModel.images.count > 0) {
								
									List(viewModel.images) { image in
										ImageView(imageItem: image)
											.listRowSeparator(.hidden)
											.listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
									}
									.onAppear() {
										UITableView.appearance().backgroundColor = AppColorScheme.tableBackground
									}
								}
							}
					)
						.navigationBarTitle(
							Text(viewModel.title)
						)
			}

	}
}

