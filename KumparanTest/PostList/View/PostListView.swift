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
				if !viewModel.isPostDataEmpty() {
					List {

						ForEach($viewModel.postData, id: \.id) { item in

							Button {
								print(item)
							} label: {
								PostCardView(
									usersData: $viewModel.usersData,
									postItem: item
								)
									.padding(.vertical, 10)
							}
							.buttonStyle(PlainButtonStyle())
						}

					}
					.listStyle(PlainListStyle())

				} else if !viewModel.isLoading && viewModel.isPostDataEmpty() {
					VStack {
						Spacer()

						Text(KTLocalizable.dataEmptyText)

						Spacer()
					}

				}
			}
			.alert(isPresented: $viewModel.isError) {
				Alert(
					title: Text(KTLocalizable.attentionText),
					message: Text(viewModel.errorMessageText()),
					dismissButton: .default(
						Text(KTLocalizable.okText)
					)
				)
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
