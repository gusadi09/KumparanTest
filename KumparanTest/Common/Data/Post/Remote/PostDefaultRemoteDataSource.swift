//
//  PostDefaultRemoteDataSource.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import Foundation
import Moya

final class PostDefaultRemoteDataSource: PostRemoteDataSource {

	private let provider: MoyaProvider<PostTargetType>

	init(provider: MoyaProvider<PostTargetType> = .defaultProvider()) {
		self.provider = provider
	}

	func getPost() async throws -> PostResponse {
		try await self.provider.requestAsync(.getPost, model: PostResponse.self)
	}
}
