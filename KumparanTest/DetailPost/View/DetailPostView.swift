//
//  DetailPostView.swift
//  KumparanTest
//
//  Created by Gus Adi on 04/02/22.
//

import SwiftUI

struct DetailPostView: View {
    var body: some View {
		ScrollView(.vertical, showsIndicators: true) {
			VStack(spacing: 30) {
				PostHeader()

				PostBody()
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

					Button {

					} label: {
						HStack {
							Circle()
								.scaledToFit()
								.frame(height: 40)
								.foregroundColor(.gray)

							Text("Bret")
								.underline()
						}
					}

				}

				Spacer()
			}

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
		}
	}

	
}

struct DetailPostView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPostView()
    }
}
