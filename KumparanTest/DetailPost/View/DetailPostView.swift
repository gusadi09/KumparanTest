//
//  DetailPostView.swift
//  KumparanTest
//
//  Created by Gus Adi on 04/02/22.
//

import SwiftUI

struct DetailPostView: View {
    var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(spacing: 10) {
				PostHeader()

				PostBody()

				CommentSection()
			}
		}
		.navigationTitle("Post Detail")
	}
}

extension DetailPostView {

	struct PostHeader: View {
		var body: some View {
			HStack {
				VStack(alignment: .leading, spacing: 15) {

					Text("unt aut facere repellat provident occaecati excepturi optio reprehenderit")
						.font(.title2)
						.bold()

					Button {

					} label: {
						HStack {
							Circle()
								.scaledToFit()
								.frame(height: 40)
								.foregroundColor(.gray)

							Text("Bret")
								.font(.subheadline)
								.underline()
								.bold()
						}
					}

				}

				Spacer()
			}
			.padding()

		}
	}

	struct PostBody: View {
		var body: some View {
			HStack {
				VStack(alignment: .leading, spacing: 10) {
					Text("quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")
						.multilineTextAlignment(.leading)

				}

				Spacer()

			}
			.padding(.horizontal)
			.padding(.bottom)
		}
	}

	struct CommentSection: View {
		var body: some View {
			VStack(alignment: .leading, spacing: 10) {
				Text("Comment")
					.font(.headline)
					.padding(.horizontal)

				ForEach(0...3, id: \.self) { item in
					VStack {
						HStack {
							CommentCardView()
								.padding()

							Spacer()
						}

						Divider()
					}
				}
			}
		}
	}
}

struct DetailPostView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPostView()
    }
}
