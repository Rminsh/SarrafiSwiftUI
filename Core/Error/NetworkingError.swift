//
//  NetworkingError.swift
//  Sarrafi
//
//  Created by vignesh on 10/19/17.
//  Copyright © 2021 Shalchian. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case badNetworkingRequest
    case errorParse
    case unexpectedError
}

extension NetworkingError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badNetworkingRequest:
            return NSLocalizedString("network_error_failed", comment: "")
        case .errorParse:
            return NSLocalizedString("network_error_parsing", comment: "")
        case .unexpectedError:
            return NSLocalizedString("network_error_unexpected", comment: "")
        }
    }
}

extension NetworkingError: Identifiable {
    var id: String? {
        errorDescription
    }
}
