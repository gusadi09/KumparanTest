//
//  PostCardViewModel.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import Foundation

final class PostCardViewModel: ObservableObject {

	private let usersRepository: UsersRepository

	@Published var postItem: Post

	@Published var isLoading = false

	@Published var error: KTErrorMessage?

	@Published var username = ""

	@Published var userCompanyName = ""

	init(usersRepository: UsersRepository = UsersDefaultRepository(), postItem: Post) {
		self.usersRepository = usersRepository
		self.postItem = postItem
	}

	func postTitle() -> String {
		postItem.title ?? ""
	}

	func postBody() -> String {
		postItem.body ?? ""
	}

	@MainActor func fetchUsersStarted() {
		self.isLoading = true
		self.error = nil
	}

	func getUsers() async {
		await fetchUsersStarted()

		do {
			let response = try await usersRepository.provideGetUsers()

			DispatchQueue.main.async { [weak self] in
				self?.isLoading = false

				self?.getUsername(by: response)

				self?.getUsersCompanyName(by: response)
			}

		} catch let error as KTErrorMessage {
			DispatchQueue.main.async { [weak self] in
				self?.isLoading = false
				self?.error = error
			}

		} catch {
			DispatchQueue.main.async { [weak self] in
				self?.isLoading = false
				self?.error = .clientError(message: error)
			}

		}
	}

	func getUsername(by data: UsersResponse) {
		for item in data where item.id == postItem.userId {
			self.username = item.username ?? ""
		}
	}

	func getUsersCompanyName(by data: UsersResponse) {
		for item in data where item.id == postItem.userId {
			self.userCompanyName = item.company?.name ?? ""
		}
	}

	func onPostCardAppear() {
		Task.init {
			await getUsers()
		}
	}
}
