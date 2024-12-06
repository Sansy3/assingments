import Foundation

struct APIResponse: Decodable {
    let rates: [String: Double]
}

class CurrencyModel {

    func fetchExchangeRates(completion: @escaping (Result<[String: Double], Error>) -> Void) {
        let urlString = "https://api.exchangerate-api.com/v4/latest/USD"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: -1, userInfo: nil)))
                return
            }

            do {
                let response = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(.success(response.rates))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
