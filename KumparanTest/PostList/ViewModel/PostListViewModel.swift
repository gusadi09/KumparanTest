//
//  PostListViewModel.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import Foundation

final class PostListViewModel: ObservableObject {
	private let repository: PostRepository

	@Published var isLoading = false
	@Published var postData: PostResponse?
	@Published var error: KTErrorMessage?

	init(repository: PostRepository = PostDefaultRepository()) {
		self.repository = repository
	}

	@MainActor func fetchPostStarted() {
		self.isLoading = true
		self.error = nil
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
			}

		} catch {
			DispatchQueue.main.async { [weak self] in
				self?.isLoading = false
				self?.error = .clientError(message: error)
			}

		}
	}

	func isPostDataEmpty() -> Bool {
		postData?.isEmpty ?? false
	}

	func onPostAppear() {
		Task.init {
			await getPost()
		}
	}
}
