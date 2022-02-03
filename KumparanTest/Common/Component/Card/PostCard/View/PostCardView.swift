//
//  PostCard.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import SwiftUI

struct PostCardView: View {
    var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			Text("Post Title")
				.font(.headline)

			Text("Post Body")
				.font(.subheadline)
				.lineLimit(1)

			HStack {
				Text("username")

				Text("company name")

				Spacer()
			}
			.foregroundColor(.gray)
			.font(.footnote)
		}
		.contentShape(Rectangle())
    }
}

struct PostCardView_Previews: PreviewProvider {
    static var previews: some View {
        PostCardView()
    }
}
