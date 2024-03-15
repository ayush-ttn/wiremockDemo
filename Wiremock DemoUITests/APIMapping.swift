//
//  APIMocking.swift
//  Wiremock DemoUITests
//
//  Created by Piyush Bharadwaj on 15/03/24.
//

import Foundation

func createMapping(for endpoint: String, requestType: String, bodyFileName: String, statusCode: Int) async {
  let url = URL(string: "http://localhost:9999/__admin/mappings")!
  var request = URLRequest(url: url)
  request.httpMethod = "POST"
  request.addValue("application/json", forHTTPHeaderField: "Content-Type")
  
  let mappingData: [String: Any] = [
    "request": [
      "method": requestType,
      "url": endpoint
    ],
    "response": [
      "status": statusCode,
      "bodyFileName": bodyFileName      
    ]
  ]
  
  request.httpBody = try? JSONSerialization.data(withJSONObject: mappingData)
  
  let _ = try? await URLSession.shared.data(for: request)
}
