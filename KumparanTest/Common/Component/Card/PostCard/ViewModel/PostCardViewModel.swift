//
//  PostCardViewModel.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import Foundation

final class PostCardViewModel: ObservableObject {

	@Published var isLoading = false

	@Published var error: KTErrorMessage?

	@Published var username = ""

	@Published var userCompanyName = ""

	func postTitle(with postItem: Post) -> String {
		postItem.title ?? ""
	}

	func postBody(with postItem: Post) -> String {
		postItem.body ?? ""
	}

	func getUsername(by data: UsersResponse, with postItem: Post) {
		for item in data where item.id == postItem.userId {
			self.username = item.username ?? ""

		}
	}

	func getUsersCompanyName(by data: UsersResponse, with postItem: Post) {
		for item in data where item.id == postItem.userId {
			self.userCompanyName = item.company?.name ?? ""
		}
	}
}
