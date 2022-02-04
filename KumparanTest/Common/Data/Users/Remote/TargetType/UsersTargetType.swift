//
//  UsersTargetType.swift
//  KumparanTest
//
//  Created by Gus Adi on 04/02/22.
//

import Foundation
import Moya

enum UsersTargetType {
	case getUser
}

extension UsersTargetType: KumparanTestTargetType {
	var parameters: [String : Any] {
		return [:]
	}

	var path: String {
		switch self {
			case .getUser:
				return "/users"
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
			case .getUser:
				return .get
		}
	}
}
