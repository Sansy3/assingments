import UIKit

class CurrencyConverterViewController: UIViewController {

    // UI Components
    let amountTextField = UITextField()
    let fromCurrencyTextField = UITextField()
    let toCurrencyTextField = UITextField()
    let convertButton = UIButton(type: .system)
    let resultLabel = UILabel()

    var viewModel: CurrencyConverterViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CurrencyConverterViewModel()

        view.backgroundColor = .white
        title = "Currency Converter"

        setupUI()

        // Fetch exchange rates from ViewModel
        fetchExchangeRates()
    }

    // Setup UI components
    func setupUI() {
        // Amount Text Field
        amountTextField.placeholder = "Enter amount"
        amountTextField.borderStyle = .roundedRect
        amountTextField.keyboardType = .decimalPad
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(amountTextField)

        // From Currency Text Field
        fromCurrencyTextField.placeholder = "From Currency (e.g., USD)"
        fromCurrencyTextField.borderStyle = .roundedRect
        fromCurrencyTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fromCurrencyTextField)

        // To Currency Text Field
        toCurrencyTextField.placeholder = "To Currency (e.g., EUR)"
        toCurrencyTextField.borderStyle = .roundedRect
        toCurrencyTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toCurrencyTextField)

        // Convert Button
        convertButton.setTitle("Convert", for: .normal)
        convertButton.addTarget(self, action: #selector(convertCurrencyTapped), for: .touchUpInside)
        convertButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(convertButton)

        // Result Label
        resultLabel.text = "Converted Amount: "
        resultLabel.textAlignment = .center
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabel)

        // Set up constraints
        NSLayoutConstraint.activate([
            amountTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            amountTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            amountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            amountTextField.heightAnchor.constraint(equalToConstant: 40),

            fromCurrencyTextField.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 20),
            fromCurrencyTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            fromCurrencyTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            fromCurrencyTextField.heightAnchor.constraint(equalToConstant: 40),

            toCurrencyTextField.topAnchor.constraint(equalTo: fromCurrencyTextField.bottomAnchor, constant: 20),
            toCurrencyTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            toCurrencyTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            toCurrencyTextField.heightAnchor.constraint(equalToConstant: 40),

            convertButton.topAnchor.constraint(equalTo: toCurrencyTextField.bottomAnchor, constant: 20),
            convertButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            convertButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            convertButton.heightAnchor.constraint(equalToConstant: 50),

            resultLabel.topAnchor.constraint(equalTo: convertButton.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resultLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    // Fetch exchange rates from ViewModel
    func fetchExchangeRates() {
        viewModel.fetchExchangeRates { result in
            switch result {
            case .success():
                print("Exchange rates fetched successfully")
            case .failure(let error):
                DispatchQueue.main.async {
                    self.resultLabel.text = "Error fetching rates: \(error.localizedDescription)"
                }
            }
        }
    }

    // MARK: - Actions
    @objc func convertCurrencyTapped() {
        // Trigger the conversion when the button is pressed
        if let amountText = amountTextField.text, let amount = Double(amountText),
           let fromCurrency = fromCurrencyTextField.text, !fromCurrency.isEmpty,
           let toCurrency = toCurrencyTextField.text, !toCurrency.isEmpty {

            // Call ViewModel to perform conversion
            if let convertedAmount = viewModel.convertCurrency(fromAmount: amount, fromCurrency: fromCurrency, toCurrency: toCurrency) {
                resultLabel.text = "Converted Amount: \(String(format: "%.2f", convertedAmount))"
            } else {
                resultLabel.text = "Error: Invalid currency code"
            }
        } else {
            resultLabel.text = "Please enter valid values"
        }
    }
}


#Preview {
    return CurrencyConverterViewController()
}
