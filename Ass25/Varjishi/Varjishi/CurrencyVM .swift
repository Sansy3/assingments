import Foundation

class CurrencyConverterViewModel {

    private let currencyModel = CurrencyModel()
    var exchangeRates: [String: Double] = [:]

    func fetchExchangeRates(completion: @escaping (Result<Void, Error>) -> Void) {
        currencyModel.fetchExchangeRates { result in
            switch result {
            case .success(let rates):
                self.exchangeRates = rates
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func convertCurrency(fromAmount amount: Double, fromCurrency: String, toCurrency: String) -> Double? {
        guard let fromRate = exchangeRates[fromCurrency], let toRate = exchangeRates[toCurrency] else {
            return nil
        }

        // Convert the amount using the exchange rates
        let convertedAmount = (amount / fromRate) * toRate
        return convertedAmount
    }
}
