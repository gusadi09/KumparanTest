//
//  CommentCardView.swift
//  KumparanTest
//
//  Created by Gus Adi on 04/02/22.
//

import SwiftUI

struct CommentCardView: View {
	var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			Text("id labore ex et quam laborum")
				.font(.headline)
			
			Text("laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium")
				.font(.body)
			
		}
	}
}

struct CommentCardView_Previews: PreviewProvider {
    static var previews: some View {
        CommentCardView()
    }
}
