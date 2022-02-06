//
//  Comments.swift
//  KumparanTest
//
//  Created by Gus Adi on 06/02/22.
//

import Foundation

struct Comment: Codable {
	let postId: UInt?
	let id: UInt?
	let name: String?
	let email: String?
	let body: String?
}

typealias CommentsResponse = [Comment]
