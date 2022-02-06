//
//  CommentsDefaultRepository.swift
//  KumparanTest
//
//  Created by Gus Adi on 06/02/22.
//

import Foundation

final class CommentsDefaultRepository: CommentsRepository {

	private let remoteDataSource: CommentsRemoteDataSource

	init(remoteDataSource: CommentsRemoteDataSource = CommentsDefaultRemoteDataSource()) {
		self.remoteDataSource = remoteDataSource
	}

	func provideGetComments(by postId: UInt) async throws -> CommentsResponse {
		try await self.remoteDataSource.getComments(by: postId)
	}
}
