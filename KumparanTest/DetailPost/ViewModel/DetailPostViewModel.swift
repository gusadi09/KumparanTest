//
//  DetailPostViewModel.swift
//  KumparanTest
//
//  Created by Gus Adi on 04/02/22.
//

import Foundation

final class DetailPostViewModel: ObservableObject {

	private let commentsRepository: CommentsRepository

	@Published var isLoading = false
	@Published var commentData = CommentsResponse()
	@Published var error: KTErrorMessage?
	@Published var isError = false

	@Published var author = ""

	init(
		commentsRepository: CommentsRepository = CommentsDefaultRepository()
	) {
		self.commentsRepository = commentsRepository
	}

	func postTitle(post: Post) -> String {
		post.title ?? ""
	}

	func postAuthor(user: UsersResponse, postItem: Post) {
		for item in user where item.id == postItem.userId {
			self.author = item.username ?? ""
		}
	}

	func postBody(post: Post) -> String {
		post.body ?? ""
	}

	@MainActor func fetchPostStarted() {
		self.isLoading = true
		self.error = nil
		self.isError = false
	}

	func getComments(by postId: UInt) async {
		await fetchPostStarted()

		do {
			let response = try await commentsRepository.provideGetComments(by: postId)

			DispatchQueue.main.async { [weak self] in
				self?.isLoading = false
				self?.commentData = response
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

	func onDetailAppear(by postId: UInt) {
		Task.init {
			await getComments(by: postId)
		}
	}
}
