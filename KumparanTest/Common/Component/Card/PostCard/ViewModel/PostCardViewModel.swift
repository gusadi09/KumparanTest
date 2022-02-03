//
//  PostCardViewModel.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import Foundation

final class PostCardViewModel: ObservableObject {

	@Published var postItem: Post

	init(postItem: Post) {
		self.postItem = postItem
	}

	func postTitle() -> String {
		postItem.title ?? ""
	}

	func postBody() -> String {
		postItem.body ?? ""
	}
}
