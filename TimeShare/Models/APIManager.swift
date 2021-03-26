//
//  APIManager.swift
//  TimeShare
//
//  Created by Bo LeGrand on 3/18/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import Foundation

struct APIManager {
        
    func postRequest(to path: String, with json: [String: Any]) {
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        let url = URL(string: K.FStore.serverURL + path)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON) // Code after Successfull POST Request
            }
        }

        task.resume()
    }

    static func postRequest2<T: Codable>(to path: String, with payload: T) {
        // https://gist.github.com/hubertcross/20e664155d09f8423cb2e555ad3b0ede

        let url = URL(string: K.FStore.serverURL + path)!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // Headers must specify that the HTTP request body is JSON-encoded
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers

        // encode post struct into JSON format
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(payload)
            request.httpBody = jsonData
        } catch {
            print(String(describing: error))
        }

        // set up the session
        URLSession.shared.dataTask(with: request) { _, response, error in
            // check for any errors
            guard error == nil else {
                print("error calling POST on (url)")
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200 ... 299).contains(httpResponse.statusCode)
            else {
                print("Fetch failed: Server error")
                return
            }
            // Success response
            print("HTTP Post successful. Return code: " + String(httpResponse.statusCode))
            if let mimeType = httpResponse.mimeType /* , mimeType == "application/json" */ {
                print("MimeType: " + mimeType)
            }
        }.resume()
    }
}
