//
//  PostRemoteDataSource.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import Foundation
import Moya

protocol PostRemoteDataSource {
	func getPost() async throws -> PostResponse
}
