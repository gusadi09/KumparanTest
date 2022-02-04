//
//  UsersRemoteDataSource.swift
//  KumparanTest
//
//  Created by Gus Adi on 04/02/22.
//

import Foundation

protocol UsersRemoteDataSource {
	func getUsers() async throws -> UsersResponse
}
