import UIKit

class LoginViewController: UIViewController {

    
 
    private let keychainManager = KeychainManager()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
            imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .black
        imageView.backgroundColor = .white
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.layer.cornerRadius = 40 
            imageView.layer.masksToBounds = true
            return imageView
    }()
    
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.textColor = .white
        label.font = UIFont(name: "Sen", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .white
        label.font = UIFont(name: "Sen", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let confirmPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Confirm Password"
        label.textColor = .white
        label.font = UIFont(name: "Sen", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(white: 1.0, alpha: 0.2)
        textField.layer.cornerRadius = 8
        textField.textColor = .white
        textField.font = UIFont(name: "Sen", size: 16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
                string: " Enter username",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.7)]
            )
        return textField
        
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(white: 1.0, alpha: 0.2)
        textField.layer.cornerRadius = 8
        textField.textColor = .white
        textField.font = UIFont(name: "Sen", size: 16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
                string: " Enter password",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.7)]
            )
        return textField
    }()
    
    private let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(white: 1.0, alpha: 0.2)
        textField.layer.cornerRadius = 8
        textField.textColor = .white
        textField.font = UIFont(name: "Sen", size: 16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
                string: " Enter password",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.7)]
            )
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor(red: 142/255, green: 132/255, blue: 255/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadDetailsOfData()
        applyGradientBackground()
    }
    
 
    

    private func setupUI() {
        view.backgroundColor = UIColor.black
        
        view.addSubview(iconImageView)
        view.addSubview(usernameLabel)
        view.addSubview(usernameTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordLabel)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(loginButton)

        
        

        iconImageView.layer.cornerRadius = 50
            iconImageView.layer.masksToBounds = true
            iconImageView.layer.borderWidth = 2
            iconImageView.layer.borderColor = UIColor.white.cgColor
        iconImageView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 104),
            iconImageView.heightAnchor.constraint(equalToConstant: 98.21),
            
            usernameLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 40),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 8),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 8),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    

    
    
    private func loadDetailsOfData() {
        if let usernameData = keychainManager.get(service: "some service", account: "username"),
           let passwordData = keychainManager.get(service: "some service", account: "password") {
            usernameTextField.text = String(decoding: usernameData, as: UTF8.self)
            passwordTextField.text = String(decoding: passwordData, as: UTF8.self)
        }
    }
    
    @objc private func loginButtonTapped() {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text,
              let confirmPassword = confirmPasswordTextField.text
        
        else { return }
        
        
        if password != confirmPassword {
            print("Passwords do not match!")
            return
        }
        
        do {
            try keychainManager.save(service: "some service", account: "username", password: username.data(using: .utf8) ?? Data())
            try keychainManager.save(service: "some service", account: "password", password: password.data(using: .utf8) ?? Data())
            print("Details saved!")
            
            
            
        } catch {
            
            print("Failed to save data: \(error)")
        }
        let homeVC = Quizz()
                   navigationController?.pushViewController(homeVC, animated: true)
        
        
                
    }
    
    
    
}


#Preview{
    LoginViewController()
}
