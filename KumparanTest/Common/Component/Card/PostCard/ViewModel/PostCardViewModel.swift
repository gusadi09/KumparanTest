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

	private let usersRepository: UsersRepository

	@Published var usersData: Users?
	@Published var isError = false
	@Published var postItem: Post
	@Published var user: UsersResponse

	init(usersRepository: UsersRepository = UsersDefaultRepository(), postItem: Post, user: UsersResponse) {
		self.usersRepository = usersRepository
		self.postItem = postItem
		self.user = user
	}

	func postTitle() -> String {
		postItem.title ?? ""
	}

	func postBody() -> String {
		postItem.body ?? ""
	}

	func getUsername() {
		for items in user where items.id == postItem.userId {
			self.username = items.username ?? ""
		}
	}
	
	func getUsersCompanyName() {
		for items in user where items.id == postItem.userId {
			self.userCompanyName = items.company?.name ?? ""
		}
	}

	@MainActor func fetchPostStarted() {
		self.isLoading = true
		self.error = nil
		self.isError = false
	}

	func getUsers(by id: UInt) async {
		await fetchPostStarted()

		do {
			let response = try await usersRepository.provideGetDetailUsers(by: id)

			DispatchQueue.main.async { [weak self] in
				self?.isLoading = false

				self?.usersData = response
			}

		} catch let error as KTErrorMessage {
			DispatchQueue.main.async { [weak self] in
				self?.isLoading = false
				self?.error = error
				self?.isError = true
			}

		} catch {
			DispatchQueue.main.async { [weak self] in
				self?.isLoading = false
				self?.error = .clientError(message: error)
				self?.isError = true
			}

		}
	}
}
