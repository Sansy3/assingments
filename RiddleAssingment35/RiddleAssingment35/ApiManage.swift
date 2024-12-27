//import Alamofire
//
//class NetworkManager {
//    static let shared = NetworkManager()
//    private init() {}
//
//    // Fetch riddle (emoji sequence)
//    func fetchRiddle(completion: @escaping (String?) -> Void) {
//        let url = "https://api.together.xyz/v1/chat/completions"
//        let headers: HTTPHeaders = [
//            "Authorization": "Bearer 57d285a0cb0e8f834d68d79a9cad2abf1bd0783a736df52e9816954f75e5c046",  // Replace with actual key
//            "Content-Type": "application/json"
//        ]
//        let parameters: [String: Any] = [
//            "model": "meta-llama/Llama-3.3-70B-Instruct-Turbo",
//            "messages": [
//                ["role": "user", "content": "Please generate a riddle using emojis"]
//            ]
//        ]
//        
//        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
//            .validate(statusCode: 200..<500)
//            .responseJSON { response in
//                switch response.result {
//                case .success(let value):
//                    if let json = value as? [String: Any],
//                       let choices = json["choices"] as? [[String: Any]],
//                       let message = choices.first?["message"] as? [String: Any],
//                       let content = message["content"] as? String {
//                        completion(content)  // Return riddle emoji sequence
//                    } else {
//                        completion(nil)
//                    }
//                case .failure(let error):
//                    print("Request failed with error: \(error.localizedDescription)")
//                    completion(nil)
//                }
//            }
//    }
//
//    // Fetch answer options
//    func fetchOptions(completion: @escaping ([String]?) -> Void) {
//        let url = "https://api.together.xyz/v1/chat/completions"
//        let headers: HTTPHeaders = [
//            "Authorization": "Bearer YOUR_API_KEY",  // Replace with actual key
//            "Content-Type": "application/json"
//        ]
//        let parameters: [String: Any] = [
//            "model": "meta-llama/Llama-3.3-70B-Instruct-Turbo",
//            "messages": [
//                ["role": "user", "content": "Please provide four answer options for the riddle."]
//            ]
//        ]
//        
//        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
//            .validate(statusCode: 200..<500)
//            .responseJSON { response in
//                switch response.result {
//                case .success(let value):
//                    if let json = value as? [String: Any],
//                       let choices = json["choices"] as? [[String: Any]],
//                       let message = choices.first?["message"] as? [String: Any],
//                       let content = message["content"] as? String {
//                        let options = self.parseOptions(from: content)
//                        completion(options)
//                    } else {
//                        completion(nil)
//                    }
//                case .failure(let error):
//                    print("Request failed with error: \(error.localizedDescription)")
//                    completion(nil)
//                }
//            }
//    }
//
//    // Parse options from the response content
//    func parseOptions(from content: String) -> [String]? {
//        let options = content.split(separator: "\n").map { String($0) }
//        return options
//    }
//}
