import UIKit
import SwiftUI

class RiddleViewController: UIViewController {
    var riddleLabel: UILabel!
    var riddle: String?
    var options: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Emoji Riddle"

        riddleLabel = UILabel()
        riddleLabel.numberOfLines = 0
        riddleLabel.textAlignment = .center
        riddleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(riddleLabel)

        NSLayoutConstraint.activate([
            riddleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            riddleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            riddleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            riddleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])

        // Fetch the riddle and options
        fetchRiddleAndOptions()
    }

    func fetchRiddleAndOptions() {
        NetworkManager.shared.fetchRiddle { [weak self] riddle in
            guard let self = self, let riddle = riddle else {
                print("Failed to fetch riddle")
                return
            }

            // Store riddle
            self.riddle = riddle
            self.riddleLabel.text = riddle

            // Fetch options
            NetworkManager.shared.fetchOptions { options in
                guard let options = options else {
                    print("Failed to fetch options")
                    return
                }

                // Store options and handle them
                self.options = options
                print("Riddle: \(riddle)")
                print("Options: \(options)")
                
                // You can now display the options or process them further
            }
        }
    }
}
