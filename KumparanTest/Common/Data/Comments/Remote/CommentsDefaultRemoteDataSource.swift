//
//  CommentsDefaultRemoteDataSource.swift
//  KumparanTest
//
//  Created by Gus Adi on 06/02/22.
//

import Foundation
import Moya

final class CommentsDefaultRemoteDataSource: CommentsRemoteDataSource {

	private let provider: MoyaProvider<CommentsTargetType>

	init(provider: MoyaProvider<CommentsTargetType> = .defaultProvider()) {
		self.provider = provider
	}

	func getComments() async throws -> CommentsResponse {
		try await self.provider.requestAsync(.getComments, model: CommentsResponse.self)
	}
}
