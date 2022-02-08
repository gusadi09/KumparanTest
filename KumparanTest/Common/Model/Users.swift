//
//  Users.swift
//  KumparanTest
//
//  Created by Gus Adi on 04/02/22.
//

import Foundation

struct Users: Codable {
	let id: UInt?
	let name: String?
	let username: String?
	let email: String?
	let address: Address?
	let phone: String?
	let website: String?
	let company: Company?
}

struct Address: Codable {
	let street: String?
	let suite: String?
	let city: String?
	let zipcode: String?
}

struct Company: Codable {
	let name: String?
	let catchPhrase: String?
	let bs: String?
}

typealias UsersResponse = [Users]
