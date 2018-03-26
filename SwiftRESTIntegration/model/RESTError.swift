//
//  RESTError.swift
//  SwiftRESTIntegration
//
//  Created by Lawrence F MacFadyen on 2018-03-05.
//  Copyright © 2018 Lawrence F MacFadyen. All rights reserved.
//

import Foundation

enum RESTError: Error {
    case invalidResponse
    case invalidData
    case requestFailed
    case jsonParsingFailure
    case noResource
    case badURL
    case couldNotEscape
    case invalidPostalCode
    case custom(message: String)
    
    var localizedDescription: String {
        switch self {
        case .invalidResponse: return "The response was not valid."
        case .invalidData: return "The data returned was not valid."
        case .requestFailed: return "Request Failed."
        case .jsonParsingFailure: return "JSON Parsing Failure."
        case .noResource: return "It looks like you entered an invalid URL."
        case .badURL: return "Could not construct the URL."
        case .couldNotEscape: return "Could not escape the URL value."
        case .invalidPostalCode: return "The postal code you entered is not valid."
        // .custom will allow us to return the backend error message for any cases we choose
        case .custom(let message): return message
        }
    }
}


