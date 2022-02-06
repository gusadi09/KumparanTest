//
//  CommentsRepository.swift
//  KumparanTest
//
//  Created by Gus Adi on 06/02/22.
//

import Foundation

protocol CommentsRepository {
	func provideGetComments() async throws -> CommentsResponse
}
