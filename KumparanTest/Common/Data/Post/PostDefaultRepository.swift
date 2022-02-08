//
//  PostDefaultRepository.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import Foundation

final class PostDefaultRepository: PostRepository {

	private let remoteDataSource: PostRemoteDataSource

	init(remoteDataSource: PostRemoteDataSource = PostDefaultRemoteDataSource()) {
		self.remoteDataSource = remoteDataSource
	}

	func provideGetPost() async throws -> PostResponse {
		try await self.remoteDataSource.getPost()
	}
}
