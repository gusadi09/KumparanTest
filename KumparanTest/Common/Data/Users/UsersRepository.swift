//
//  UsersRepository.swift
//  KumparanTest
//
//  Created by Gus Adi on 04/02/22.
//

import Foundation

protocol UsersRepository {
	func provideGetUsers() async throws -> UsersResponse
}
