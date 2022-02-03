//
//  MoyaProvider+RequestAsync.swift
//  KumparanTest
//
//  Created by Gus Adi on 03/02/22.
//

import Foundation
import Moya

extension MoyaProvider {

	func requestAsync<T: Codable>(_ target: Target, model: T.Type) async throws -> T {
		return try await withCheckedThrowingContinuation({ continuation in
			self.request(target) { result in
				switch result {
					case .failure(let error):
						let errorMsg = KTErrorMessage.clientError(message: error)

						continuation.resume(throwing: errorMsg)

					case .success(let response):
						let statusCode = response.statusCode
						let jsonDecoder = JSONDecoder()
						jsonDecoder.dateDecodingStrategy = .iso8601

						do {
							if statusCode == 200 {
								let decodedData = try jsonDecoder.decode(model.self, from: response.data)

								continuation.resume(returning: decodedData)
							} else {
								let errorMessage = KTErrorMessage.serverError(message: "Can't load data from server")

								continuation.resume(throwing: errorMessage)
							}
						} catch {
							let localizedError = KTErrorMessage.clientError(message: error)

							continuation.resume(throwing: localizedError)
						}
				}
			}
		})
	}

}
