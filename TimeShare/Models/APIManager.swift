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
                print(responseJSON) //Code after Successfull POST Request
            }
        }
        
        task.resume()
    }
    
}
