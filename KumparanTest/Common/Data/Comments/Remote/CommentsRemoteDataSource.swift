//
//  CommentsRemoteDataSource.swift
//  KumparanTest
//
//  Created by Gus Adi on 06/02/22.
//

import Foundation

protocol CommentsRemoteDataSource {
	func getComments() async throws -> CommentsResponse
}
