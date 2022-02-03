//
//  UsersDefaultRemoteDataSource.swift
//  KumparanTest
//
//  Created by Gus Adi on 04/02/22.
//

import Foundation
import Moya

final class UsersDefaultRemoteDataSource: UsersRemoteDataSource {

	private let provider: MoyaProvider<UsersTargetType>

	init(provider: MoyaProvider<UsersTargetType> = .defaultProvider()) {
		self.provider = provider
	}

	func getUsers() async throws -> UsersResponse {
		try await self.provider.requestAsync(.getUser, model: UsersResponse.self)
	}
}
