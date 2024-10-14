//
//  CalculatorVc.swift
//  CalculatorLayoutCode
//
//  Created by beqa on 13.10.24.
//



import UIKit


class CalculatorVC: UIViewController {
    
    //UI components

    private let Calculatorstackview = UIStackView()
    private let back = UIView()
    private let Backgroundview1 = UIView()
    private var label = UILabel()
    private var label1 = UILabel()
    private var firstRow = UIStackView()
    private var secondRow = UIStackView()
    private var thirdRow = UIStackView()
    private var forthRow = UIStackView()
    private var fifthRow = UIStackView()
    private var sisxthRow = UIStackView()
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
        addbuttontoforthrow()
        setupLabel()
        setUpMainLable()
        
    }
    
    private func setupLabel() {
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2,048"
        label.font = UIFont.systemFont(ofSize: 48)
        label.textColor = .black
        view.addSubview(label)
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 202).isActive = true
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 223).isActive = true
        
    
    }
    private func setUpMainLable() {
        view.addSubview(label1)
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.textColor = .lightGray
        label1.font = .systemFont(ofSize: 25)
        label1.text = "120 x 3 + 608 + 1080"
        label1.bottomAnchor.constraint(equalTo: label.topAnchor, constant: 8).isActive = true
        label1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -43).isActive = true
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
        forthrow1()

    }
    
    
    private func forthrow1() {
            forthRow.axis = .vertical
            forthRow.alignment = .fill
            forthRow.distribution = .fillProportionally
            forthRow.spacing = 16
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
        
    }
    private func buttonWithNumber(number: String) -> UIButton {
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
            
            return button
        }
        

    private func buttonWithImage(imageName: String) -> UIButton {
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


        if let image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal) {
               button.setImage(image, for: .normal)
           } else {
               print("Image named \(imageName) not found in assets.")
           }
        
        return button
    }

    
    private func addbuttonstorfirstrow() {
        button1 = buttonWithImage(imageName: "moonSvg1")
        button1.layer.borderWidth = 1
        button1.backgroundColor = .clear 
        button2 = buttonWithNumber(number: "7")
        button2.layer.borderWidth = 0
        button3 = buttonWithNumber(number: "4")
        button3.layer.borderWidth = 0
        button4 = buttonWithNumber(number: "1")
        button4.layer.borderWidth = 0
        button5 = buttonWithNumber(number: "AC")
        button5.layer.borderWidth = 0
        button5.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: .normal)
        

    
        firstRow.addArrangedSubview(button1)
        firstRow.addArrangedSubview(button2)
        firstRow.addArrangedSubview(button3)
        firstRow.addArrangedSubview(button4)
        firstRow.addArrangedSubview(button5)
           }
    
    private func addbuttonstosecondrow() {
         button6 = buttonWithImage(imageName:"percentSvg" )
         button7 = buttonWithNumber(number: "8")
         button7.layer.borderWidth = 0
         button8 = buttonWithNumber(number: "5")
         button8.layer.borderWidth = 0
         button9 = buttonWithNumber(number: "2")
         button9.layer.borderWidth = 0
         button10 = buttonWithNumber(number: "0")
         button10.layer.borderWidth = 0


        secondRow.addArrangedSubview(button6)
        secondRow.addArrangedSubview(button7)
        secondRow.addArrangedSubview(button8)
        secondRow.addArrangedSubview(button9)
        secondRow.addArrangedSubview(button10)
    }
    private func addbuttontothirdrow() {
        button11 = buttonWithImage(imageName: "divideSvg")
        button12 = buttonWithNumber(number: "9")
        button12.layer.borderWidth = 0
        button13 = buttonWithNumber(number: "6")
        button13.layer.borderWidth = 0
        button14 = buttonWithNumber(number: "3")
        button14.layer.borderWidth = 0
        button15 = buttonWithNumber(number: ".")
        button15.layer.borderWidth = 0


        thirdRow.addArrangedSubview(button11)
        thirdRow.addArrangedSubview(button12)
        thirdRow.addArrangedSubview(button13)
        thirdRow.addArrangedSubview(button14)
        thirdRow.addArrangedSubview(button15)

    }
    private func addbuttontoforthrow(){
        button16 = buttonWithImage(imageName: "multipleSvg")
        button17 = buttonWithImage(imageName: "decrement")
        button18 = buttonWithImage(imageName: "increment")
        button19 = UIButton(type: .system)
        button19.translatesAutoresizingMaskIntoConstraints = false
        button19.layer.borderWidth = 2
        button19.layer.borderColor = UIColor.lightGray.cgColor
        button19.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button19.setTitle("=", for: .normal)
        button19.layer.masksToBounds = true
        button19.frame = CGRect(x: 0, y: 0, width: 64, height: 128)
        button19.layer.cornerRadius = button19.frame.width / 2
        button19.tintColor = .black
        forthRow.addArrangedSubview(button16)
        forthRow.addArrangedSubview(button17)
        forthRow.addArrangedSubview(button18)
        forthRow.addArrangedSubview(button19)
    }
    

    
    
}

