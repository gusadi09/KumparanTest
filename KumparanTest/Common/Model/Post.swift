//
//  Post.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import Foundation

struct Post: Codable {
	let userId: UInt?
	let id: UInt?
	let title: String?
	let body: String?
}

typealias PostResponse = [Post]
