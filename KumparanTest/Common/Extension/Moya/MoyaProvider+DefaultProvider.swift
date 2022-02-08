//
//  MoyaProvider+DefaultProvider.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import Foundation
import Moya

extension MoyaProvider {

	static func defaultProvider() -> MoyaProvider {

		return MoyaProvider(plugins: [NetworkLoggerPlugin()])
		
	}

}
