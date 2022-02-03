//
//  PostCard.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import SwiftUI

struct PostCardView: View {

	@ObservedObject var viewModel: PostCardViewModel

    var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			Text(viewModel.postTitle())
				.font(.headline)

			Text(viewModel.postBody())
				.font(.subheadline)
				.lineLimit(1)

			HStack {
				Text(viewModel.username)

				Text(viewModel.userCompanyName)

				Spacer()
			}
			.foregroundColor(.gray)
			.font(.footnote)
		}
		.contentShape(Rectangle())
		.onAppear {
			viewModel.onPostCardAppear()
		}
    }
}
