//
//  PostCard.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import SwiftUI

struct PostCardView: View {

	@ObservedObject var viewModel = PostCardViewModel()
	@Binding var usersData: UsersResponse
	@Binding var postItem: Post

    var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			Text(viewModel.postTitle(with: postItem))
				.font(.headline)

			Text(viewModel.postBody(with: postItem))
				.font(.subheadline)
				.lineLimit(1)

			HStack {
				Text(viewModel.username)

				Text(viewModel.userCompanyName)
			}
			.foregroundColor(.gray)
			.font(.footnote)
		}
		.contentShape(Rectangle())
		.onAppear {
			viewModel.getUsername(by: usersData, with: postItem)
			viewModel.getUsersCompanyName(by: usersData, with: postItem)
		}
    }
}
