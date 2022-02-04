//
//  PostListViewModel.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import Foundation

final class PostListViewModel: ObservableObject {

	private let repository: PostRepository
	private let usersRepository: UsersRepository

	@Published var isLoading = false
	@Published var postData = PostResponse()
	@Published var usersData = UsersResponse()
	@Published var error: KTErrorMessage?
	@Published var isError = false

	init(
		repository: PostRepository = PostDefaultRepository(),
		usersRepository: UsersRepository = UsersDefaultRepository()
	) {
		self.repository = repository
		self.usersRepository = usersRepository
	}

	@MainActor func fetchPostStarted() {
		self.isLoading = true
		self.error = nil
		self.isError = false
	}

	func getPost() async {
		await fetchPostStarted()

		do {
			let response = try await repository.provideGetPost()

			DispatchQueue.main.async { [weak self] in
				self?.isLoading = false
				self?.postData = response
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

	func isPostDataEmpty() -> Bool {
		postData.isEmpty
	}

	func onPostAppear() {
		Task.init {
			await getUsers()
			await getPost()
		}
	}

	func errorMessageText() -> String {
		error?.errorDescription ?? ""
	}

	func getUsers() async {
		await fetchPostStarted()

		do {
			let response = try await usersRepository.provideGetUsers()

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
