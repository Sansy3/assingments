import UIKit
import SwiftUI

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        // Set gradient background
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.purple.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        // Create the stack view for buttons
        let categories = ["Movies", "Books", "Anime"]
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        for category in categories {
            let button = createCategoryButton(for: category)
            button.addTarget(self, action: #selector(categorySelected(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func createCategoryButton(for category: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(category, for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 24)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 5
        button.heightAnchor.constraint(equalToConstant: 70).isActive = true

        let icon = getCategoryIcon(for: category)
        button.setImage(icon, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 15)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: -15)

        return button
    }

    private func getCategoryIcon(for category: String) -> UIImage? {
        switch category {
        case "Movies":
            return UIImage(systemName: "film")
        case "Books":
            return UIImage(systemName: "book.fill")
        case "Anime":
            return UIImage(systemName: "tv.fill")
        default:
            return nil
        }
    }

    @objc private func categorySelected(_ sender: UIButton) {
        guard let category = sender.titleLabel?.text else { return }
        let riddleViewModel = RiddleViewModel(category: category)
        let riddleView = RiddleView(viewModel: riddleViewModel, theme: category)
        let hostingController = UIHostingController(rootView: riddleView)
        navigationController?.pushViewController(hostingController, animated: true)
    }
}
