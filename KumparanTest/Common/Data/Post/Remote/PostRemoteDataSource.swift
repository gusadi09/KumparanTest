//
//  PostRemoteDataSource.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import Foundation

protocol PostRemoteDataSource {
	func getPost() async throws -> PostResponse
}
