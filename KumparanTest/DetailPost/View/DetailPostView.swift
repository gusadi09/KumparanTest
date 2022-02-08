//
//  DetailPostView.swift
//  KumparanTest
//
//  Created by Gus Adi on 04/02/22.
//

import SwiftUI

struct DetailPostView: View {

	@ObservedObject var viewModel = DetailPostViewModel()
	@Binding var post: Post
	@Binding var user: UsersResponse
	
    var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(spacing: 10) {
				PostHeader(viewModel: viewModel, post: $post, user: $user)

				PostBody(viewModel: viewModel, post: $post)

				CommentSection(viewModel: viewModel, post: $post)
			}
			.onAppear {
				viewModel.onDetailAppear(by: post.id ?? 0)
			}
		}
		.navigationTitle("Post Detail")
	}
}

extension DetailPostView {

	struct PostHeader: View {

		@ObservedObject var viewModel: DetailPostViewModel
		@Binding var post: Post
		@Binding var user: UsersResponse

		var body: some View {
			HStack {
				VStack(alignment: .leading, spacing: 15) {

					Text(viewModel.postTitle(post: post))
						.font(.title2)
						.bold()

					Button {

					} label: {
						HStack {
							Circle()
								.scaledToFit()
								.frame(height: 40)
								.foregroundColor(.gray)

							Text(viewModel.author)
								.font(.subheadline)
								.underline()
								.bold()
						}
					}

				}

				Spacer()
			}
			.padding()
			.onAppear {
				viewModel.postAuthor(user: user, postItem: post)
			}

		}
	}

	struct PostBody: View {

		@ObservedObject var viewModel: DetailPostViewModel
		@Binding var post: Post

		var body: some View {
			HStack {
				VStack(alignment: .leading, spacing: 10) {
					Text(viewModel.postBody(post: post))
						.multilineTextAlignment(.leading)

				}

				Spacer()

			}
			.padding(.horizontal)
			.padding(.bottom)
		}
	}

	struct CommentSection: View {

		@ObservedObject var viewModel: DetailPostViewModel
		@Binding var post: Post

		var body: some View {
			VStack(alignment: .center, spacing: 10) {
				HStack {
					Text("Comment")
						.font(.headline)
					.padding(.horizontal)

					Spacer()
				}

				if let commentData = viewModel.commentData.filter({ comment in
					comment.postId == post.id
				}) {
					ForEach(commentData, id: \.id) { item in
						VStack {
							HStack {
								CommentCardView(viewModel: CommentCardViewModel(comment: item))
									.padding()

								Spacer()
							}

							Divider()
						}
					}
				} else if viewModel.isLoading {
					VStack {
						Spacer()

						ProgressView()
							.progressViewStyle(.circular)

						Spacer()
					}
				}
			}
		}
	}
}
