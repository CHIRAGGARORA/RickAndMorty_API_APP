//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by chirag arora on 28/12/22.
//

import Foundation


/// Object that represents a singlet API call
final class RMRequest {
    
    //Base url
    //Endpoint
    //Path ccomponents
    //Query parameters
    
    /// API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired endpoint
    private let endpoint: RMEndpoint
    
    /// path components for API ,if any
    private let pathComponents: Set<String>
    
    /// Query parameters for API, if any
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
      
        string += endpoint.rawValue
        
        
        if !pathComponents.isEmpty {
            
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        
        if !queryParameters.isEmpty {
            string += "?"
            // name=value&name=value
            let argumentstring = queryParameters.compactMap({
                guard let value = $0.value else {return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentstring
            
            
//            queryParameters.forEach({
//                string += "/\($0)"
//            })
        }
        
        
        return string
    }
    
    /// Computed and constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired http method
    public let httpMethod = "GET"
    
    //MARK: - Public
    
    
    /// Construct request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collection of path components
    ///   - queryParameters: Collection of query parameters
    public init(
        endpoint: RMEndpoint,
        pathComponents: Set<String> = [],
        queryParameters: [URLQueryItem] = []
    ){
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
}
