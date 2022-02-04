//
//  PostRepository.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import Foundation

protocol PostRepository {
	func provideGetPost() async throws -> PostResponse
}
