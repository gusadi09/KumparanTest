//
//  UsersDefaultRepository.swift
//  KumparanTest
//
//  Created by Gus Adi on 04/02/22.
//

import Foundation

final class UsersDefaultRepository: UsersRepository {

	private let remoteDataSource: UsersRemoteDataSource

	init(remoteDataSource: UsersRemoteDataSource = UsersDefaultRemoteDataSource()) {
		self.remoteDataSource = remoteDataSource
	}

	func provideGetUsers() async throws -> UsersResponse {
		try await self.remoteDataSource.getUsers()
	}

	func provideGetDetailUsers(by usersId: UInt) async throws -> Users {
		try await self.remoteDataSource.getUsersDetail(by: usersId)
	}
}
