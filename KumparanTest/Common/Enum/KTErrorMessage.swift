//
//  KTErrorMessage.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import Foundation

enum KTErrorMessage: Error {
	case clientError(message: Error)
	case serverError(message: String)
}

extension KTErrorMessage {
	public var errorDescription: String {
		switch self {
			case let .clientError(message):
				return message.localizedDescription

			case let .serverError(message):
				return message
		}
	}
}
