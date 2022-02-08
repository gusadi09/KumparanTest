//
//  CommentCardViewModel.swift
//  KumparanTest
//
//  Created by Gus Adi on 04/02/22.
//

import Foundation

final class CommentCardViewModel: ObservableObject {

	@Published var comment: Comment

	init(comment: Comment) {
		self.comment = comment
	}

	func commentAuthor() -> String {
		self.comment.name ?? ""
	}

	func commentBody() -> String {
		self.comment.body ?? ""
	}
}
