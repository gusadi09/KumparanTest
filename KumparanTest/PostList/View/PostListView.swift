//
//  ContentView.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import SwiftUI

struct PostListView: View {

	@ObservedObject var viewModel = PostListViewModel()

	var body: some View {
		ZStack {

			Group {
				if let postData = viewModel.postData {
					List(postData.indices, id: \.self) { item in

						Button {
							print(postData[item].title ?? "")
						} label: {
							PostCardView(
								viewModel: PostCardViewModel(
									postItem: postData[item]
								)
							)
								.padding(.vertical, 10)
						}
						.buttonStyle(PlainButtonStyle())

					}
					.listStyle(PlainListStyle())
					.refreshable {
						await viewModel.getPost()
					}
				} else if !viewModel.isLoading && viewModel.isPostDataEmpty(){
					VStack {
						Spacer()

						Text("Uh oh, the data is empty :(")

						Spacer()
					}
				}
			}

			if viewModel.isLoading {
				ProgressView()
					.progressViewStyle(.circular)
			}

		}
		.onAppear(perform: {
			viewModel.onPostAppear()
		})
		.navigationTitle(KTLocalizable.postListViewNavigationTitle)
		.navigationBarTitleDisplayMode(.large)
	}
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
		PostListView()
    }
}
