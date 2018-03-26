//
//  PostalCode.swift
//  SwiftRESTIntegration
//
//  Created by Lawrence F MacFadyen on 2018-03-05.
//  Copyright © 2018 Lawrence F MacFadyen. All rights reserved.
//

import Foundation

// REST API wraps a single postal code in a "result" key
struct Wrapper: Decodable {
    let postalCode : PostalCode
    enum CodingKeys: String, CodingKey { case postalCode = "result" }
}

struct PostalCode: Codable, CustomDebugStringConvertible {
    // doing a subset of fields, the mandatory ones just for the demo
    var postcode: String
    var country: String
    var quality: Int

    static func endpointForCode(_ code: String) -> String {
        return "https://api.postcodes.io/postcodes/\(code)"
    }
    
    var debugDescription: String {
        return "Postal Code:\(postcode)\nCountry:\(country)\nQuality:\(quality)"
    }
}

struct ErrorJson: Codable, CustomDebugStringConvertible {
    var status: Int
    var error: String
    
    var debugDescription: String {
        return "Status:\(status)\nError Message:\(error)"
    }
}


