//
//  CommentCardView.swift
//  KumparanTest
//
//  Created by Gus Adi on 04/02/22.
//

import SwiftUI

struct CommentCardView: View {

	@ObservedObject var viewModel: CommentCardViewModel

	var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			Text(viewModel.commentAuthor())
				.font(.headline)
			
			Text(viewModel.commentBody())
				.font(.body)
			
		}
	}
}

struct CommentCardView_Previews: PreviewProvider {
    static var previews: some View {
        CommentCardView(
			viewModel: CommentCardViewModel(
				comment: Comment(
					postId: 1,
					id: 1,
					name: "",
					email: "",
					body: ""
				)
			)
		)
    }
}
