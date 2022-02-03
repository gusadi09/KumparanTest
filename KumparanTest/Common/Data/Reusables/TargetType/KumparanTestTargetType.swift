//
//  KumparanTestTargetType.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import Foundation
import Moya

protocol KumparanTestTargetType: TargetType {
	var parameters: [String: Any] {
		get
	}
}

extension KumparanTestTargetType {
	var baseURL: URL {
		return URL(string: "https://jsonplaceholder.typicode.com") ?? (NSURL() as URL)
	}

	var parameterEncoding: Moya.ParameterEncoding {
		JSONEncoding.default
	}

	var task: Task {
		return .requestParameters(parameters: parameters, encoding: parameterEncoding)
	}

	var headers: [String: String]? {
		return [:]
	}
}
