//
//  NetworkManager.swift
//  UsersTesting
//
//  Created by Nino Godziashvili on 15.11.24.
//


import UIKit

final class NetworkManager: NSObject {
    static let sharedInstance = NetworkManager()
    
    private let session: URLSessionProtocol
    var users: [User] = []
    private let baseUrl = "https://randomuser.me/api/"
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
        super.init()
    }
    
    func fetchUsers(withLimit limit: Int = 1, completionHandler: @escaping ([User]) -> Void) {
        guard let url = URL(string: baseUrl + "?results=\(limit)") else {
            print("Invalid URL")
            return
        }
        
        print("Fetching data for URL: \(url)")
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching users: \(error.localizedDescription)")
                completionHandler([])
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Unexpected status code: \(String(describing: response))")
                completionHandler([])
                return
            }
            
            if let data = data {
                do {
                    let userList = try JSONDecoder().decode(UserList.self, from: data)
                    completionHandler(userList.results)
                } catch {
                    print("Failed to decode data: \(error)")
                    completionHandler([])
                }
            }
        }
        task.resume()
    }
}

