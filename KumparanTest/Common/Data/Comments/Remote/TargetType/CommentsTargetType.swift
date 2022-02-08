//
//  CommentsTargetType.swift
//  KumparanTest
//
//  Created by Gus Adi on 06/02/22.
//

import Foundation
import Moya

enum CommentsTargetType {
	case getComments(UInt)
}

extension CommentsTargetType: KumparanTestTargetType {
	var parameters: [String : Any] {
		switch self {
			case .getComments(let postId):
				return ["postId": postId]
		}
	}

	var path: String {
		switch self {
			case .getComments:
				return "/comments"
		}
	}

	var parameterEncoding: Moya.ParameterEncoding {
		URLEncoding.default
	}

	var task: Task {
		return .requestParameters(parameters: parameters, encoding: parameterEncoding)
	}

	var method: Moya.Method {
		switch self {
			case .getComments:
				return .get
		}
	}
}
