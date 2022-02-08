//
//  PostTargetType.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import Foundation
import Moya

enum PostTargetType {
	case getPost
}

extension PostTargetType: KumparanTestTargetType {
	var parameters: [String : Any] {
		return [:]
	}

	var path: String {
		switch self {
			case .getPost:
				return "/posts"
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
			case .getPost:
				return .get
		}
	}
}
