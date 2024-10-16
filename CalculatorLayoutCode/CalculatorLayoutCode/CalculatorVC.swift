//
//  CalculatorVc.swift
//  CalculatorLayoutCode
//
//  Created by beqa on 13.10.24.
//



import UIKit


class CalculatorVC: UIViewController {
    
    //UI components
    private var isFirstTap = true
    private let Calculatorstackview = UIStackView()
    private let back = UIView()
    private let Backgroundview1 = UIView()
    private var label = UILabel()
    private var historyLabel = UILabel()
    private var firstRow = UIStackView()
    private var secondRow = UIStackView()
    private var thirdRow = UIStackView()
    private var forthRow = UIStackView()
    private var fifthRow = UIStackView()
    private var sixsth = UIStackView()
    private var button1 = UIButton()
    private var button2 = UIButton()
    private var button3 = UIButton()
    private var button4 = UIButton()
    private var button5 = UIButton()
    private var button6 = UIButton()
    private var button7 = UIButton()
    private var button8 = UIButton()
    private var button9 = UIButton()
    private var button10 = UIButton()
    private var button11 = UIButton()
    private var button12 = UIButton()
    private var button13 = UIButton()
    private var button14 = UIButton()
    private var button15 = UIButton()
    private var button16 = UIButton()
    private var button17 = UIButton()
    private var button18 = UIButton()
    private var button19 = UIButton()
    var text1 = ""
    private var resultDisplay = false
    private var historybutton = UIButton()
    private var calculationHistory: [(String, String)] = []


    //life
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
       
    }
   
    private func setupUI() {
        backgroundView()
        backgorundview1()
        setupCalculatorStack()
        addstackviews()
        addbuttonstorfirstrow()
        addbuttonstosecondrow()
        addbuttontothirdrow()
        addbuttontofifthrow()
        setupLabel()
        setUpMainLable()
        addbuttontosixthrow()
        configureHistoryButton()
    }
    
   
    
    private func setupLabel() {
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2,048"
        label.font = UIFont.systemFont(ofSize: 48)
        label.textColor = .black
        view.addSubview(label)
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 202).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        
        
    }
    private func setUpMainLable() {
        view.addSubview(historyLabel)
        historyLabel.translatesAutoresizingMaskIntoConstraints = false
        historyLabel.textColor = .lightGray
        historyLabel.font = .systemFont(ofSize: 25)
        historyLabel.text = "120 x 3 + 608 + 1080"
        historyLabel.bottomAnchor.constraint(equalTo: label.topAnchor, constant: 8).isActive = true
        historyLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -43).isActive = true
        historyLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        historyLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    }
    
    
    private func backgorundview1(){
        view.addSubview(back)
        back.translatesAutoresizingMaskIntoConstraints = false
        back.backgroundColor = .white
        back.layer.cornerRadius = 20
        back.layer.masksToBounds = true
        back.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        back.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        back.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        back.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }
    private func backgroundView() {
        view.addSubview(Backgroundview1)
        Backgroundview1.translatesAutoresizingMaskIntoConstraints = false
        Backgroundview1.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        Backgroundview1.layer.cornerRadius = 50
        Backgroundview1.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        Backgroundview1.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        Backgroundview1.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 0).isActive = true
        Backgroundview1.topAnchor.constraint(equalTo: view.topAnchor, constant: 302).isActive = true
        
    }
    
    
    
    private func setupCalculatorStack(){
        view.addSubview(Calculatorstackview)
        Calculatorstackview.translatesAutoresizingMaskIntoConstraints = false
        Calculatorstackview.backgroundColor = UIColor(red:245, green:245, blue: 245, alpha: 1)
        Calculatorstackview.layer.cornerRadius = 35
        Calculatorstackview.axis = .horizontal
        Calculatorstackview.distribution = .fillEqually
        Calculatorstackview.leftAnchor.constraint(equalTo: Backgroundview1.leftAnchor, constant: 43).isActive = true
        Calculatorstackview.rightAnchor.constraint(equalTo: Backgroundview1.rightAnchor, constant: -43).isActive = true
        Calculatorstackview.bottomAnchor.constraint(equalTo: Backgroundview1.bottomAnchor, constant: -63).isActive = true
        Calculatorstackview.topAnchor.constraint(equalTo: Backgroundview1.topAnchor, constant: 48).isActive = true
        Calculatorstackview.alignment = .fill
        Calculatorstackview.spacing = 16
        
        configureStackView(firstRow)
        configureStackView(secondRow)
        configureStackView(thirdRow)
        configureStackView(forthRow)
        configureStackView(fifthRow)
        configureStackView(sixsth)
        
    }
    
    
    
    
    
    private func configureStackView(_ stackView: UIStackView) {
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
    }
    
    
    
    private func addstackviews () {
        Calculatorstackview.addArrangedSubview(firstRow)
        firstRow.backgroundColor = UIColor(red:245, green:245, blue: 245, alpha: 1)
        Calculatorstackview.addArrangedSubview(secondRow)
        secondRow.backgroundColor = UIColor(red:245, green:245, blue: 245, alpha: 1)
        Calculatorstackview.addArrangedSubview(thirdRow)
        thirdRow.backgroundColor = UIColor(red:245, green:245, blue: 245, alpha: 1)
        Calculatorstackview.addArrangedSubview(forthRow)
        forthRow.backgroundColor = UIColor(red:245, green:245, blue: 245, alpha: 1)
        forthRow.addArrangedSubview(fifthRow)
        forthRow.addArrangedSubview(sixsth)
        
    }
    private func buttonWithNumber(number: String, tag: Int) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.setTitle(number, for: .normal)
        button.layer.masksToBounds = true
        button.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        button.layer.cornerRadius = button.frame.width / 2
        button.tintColor = .black
        button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
        button.addAction(UIAction { [weak self] _ in
            self?.buttonTapped(button)
        }, for: .touchUpInside)
        button.tag = tag
        return button
    }
    
    
    private func buttonWithImage(imageName: String, tag: Int) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.layer.masksToBounds = true
        button.tintColor = .black
        button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
        button.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        button.layer.cornerRadius = button.frame.width / 2
        button.imageView?.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        if let image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal) {
            button.setImage(image, for: .normal)
        } else {
            print("Image named \(imageName) not found in assets.")
        }
        button.addAction(UIAction { [weak self] _ in
            self?.buttonTapped(button)
        }, for: .touchUpInside)
        button.tag = tag
        
        return button
    }
    
    
    private func addbuttonstorfirstrow() {
        button1 = buttonWithImage(imageName: "moonSvg1", tag: 1)
        button1.layer.borderWidth = 1
        button1.backgroundColor = .clear
        button2 = buttonWithNumber(number: "7", tag: 2)
        button2.layer.borderWidth = 0
        button3 = buttonWithNumber(number: "4", tag: 3)
        button3.layer.borderWidth = 0
        button4 = buttonWithNumber(number: "1", tag: 4)
        button4.layer.borderWidth = 0
        button5 = buttonWithNumber(number: "AC", tag: 5)
        button5.layer.borderWidth = 0
        button5.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
        
        
        
        firstRow.addArrangedSubview(button1)
        firstRow.addArrangedSubview(button2)
        firstRow.addArrangedSubview(button3)
        firstRow.addArrangedSubview(button4)
        firstRow.addArrangedSubview(button5)
    }
    
    private func addbuttonstosecondrow() {
        button6 = buttonWithImage(imageName:"percentSvg", tag: 6 )
        button7 = buttonWithNumber(number: "8", tag: 7)
        button7.layer.borderWidth = 0
        button8 = buttonWithNumber(number: "5", tag: 8)
        button8.layer.borderWidth = 0
        button9 = buttonWithNumber(number: "2", tag: 9)
        button9.layer.borderWidth = 0
        button10 = buttonWithNumber(number: "0" , tag: 10)
        button10.layer.borderWidth = 0
        
        
        secondRow.addArrangedSubview(button6)
        secondRow.addArrangedSubview(button7)
        secondRow.addArrangedSubview(button8)
        secondRow.addArrangedSubview(button9)
        secondRow.addArrangedSubview(button10)
    }
    private func addbuttontothirdrow() {
        button11 = buttonWithImage(imageName: "divideSvg", tag: 11)
        button12 = buttonWithNumber(number: "9", tag: 12)
        button12.layer.borderWidth = 0
        button13 = buttonWithNumber(number: "6", tag: 13)
        button13.layer.borderWidth = 0
        button14 = buttonWithNumber(number: "3", tag: 14)
        button14.layer.borderWidth = 0
        button15 = buttonWithNumber(number: ".", tag: 15)
        button15.layer.borderWidth = 0
        
        thirdRow.addArrangedSubview(button11)
        thirdRow.addArrangedSubview(button12)
        thirdRow.addArrangedSubview(button13)
        thirdRow.addArrangedSubview(button14)
        thirdRow.addArrangedSubview(button15)
        
    }
    private func addbuttontofifthrow() {
        button16 = buttonWithImage(imageName: "multipleSvg", tag: 16)
        button17 = buttonWithImage(imageName: "decrement", tag: 17)
        button18 = buttonWithImage(imageName: "increment", tag: 18)
        fifthRow.addArrangedSubview(button16)
        fifthRow.addArrangedSubview(button17)
        fifthRow.addArrangedSubview(button18)
        
        
    }
    private func addbuttontosixthrow() {
        button19 = buttonWithNumber(number: "=", tag: 19)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 0.93, green: 0.05, blue: 0.60, alpha: 1).cgColor,
            UIColor(red: 0.99, green: 0.35, blue: 0.18, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)  // Top-left
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)    // Bottom-right
        gradientLayer.cornerRadius = button19.layer.cornerRadius
        button19.layer.insertSublayer(gradientLayer, at: 0)
        
        
        sixsth.addArrangedSubview(button19)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let gradientLayer = button19.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = button19.bounds
            
        }
    }
    
    
    private func buttonTapped(_ sender: UIButton) {
        
        if resultDisplay {
            text1 = ""
            label.text = ""
            historyLabel.text = ""
            resultDisplay = false
        }
        historyLabel.text = ""
        
        switch sender.tag {
        case 11:
            text1.append("/")
        case 6:
            text1.append("%")
        case 16:
            text1.append("x")
        case 17:
            text1.append("-")
        case 18:
            text1.append("+")
        case 5:  //AC
            text1 = ""
        case 19: // = Result
            let historyofnum = text1
            let result = evaluateExpression(expression: historyofnum)
            label.text = "\(result)"
            historyLabel.text = "\(historyofnum)"
            calculationHistory.append((historyofnum, "\(result)"))
            text1 = "\(result)" //
            resultDisplay = true

        default:
            if let title = sender.title(for: .normal) {
                text1.append(title)
            }
        }
        label.text = text1
    }
    
    
    
    
    private func evaluateExpression(expression: String) -> Double {
        let multiply = expression.replacingOccurrences(of: "x", with: "*")
        
        let expression = NSExpression(format: multiply)
        if let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
            return result.doubleValue
        } else {
            return 0
        }
    }
    
    private func configureHistoryButton() {
        historybutton = UIButton(type: .system)
        historybutton.translatesAutoresizingMaskIntoConstraints = false
        historybutton.setImage(UIImage(named: "historyDark"), for: .normal)
        historybutton.setTitleColor(.black, for: .normal)
        historybutton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        historybutton.backgroundColor = .white
        historybutton.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        historybutton.layer.masksToBounds = true
        historybutton.layer.cornerRadius = historybutton.bounds.width / 2
        view.addSubview(historybutton)
        historybutton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        historybutton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        historybutton.addAction(UIAction(handler: { [weak self] _ in
                    self?.SeeHistory()
                }), for: .touchUpInside)
    }
    private func SeeHistory() {
        
        let historyViewController = HistoryVC()
        historyViewController.historyEntries = calculationHistory
        navigationController?.pushViewController(historyViewController, animated: true)
        
    }
    
}
////dDSDNSDnad


