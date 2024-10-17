//
//  ViewController.swift
//  Assignment2-BasicCalculator
//  Jiali Han
//  Created by Jiali Han on 9/17/24.
//

import UIKit

class ViewController: UIViewController {
    // Create 3 Labels
    var labelTitle:UILabel!
    var labelOperation:UILabel!
    var labelResult:UILabel!
    
    // Create 2 TextFields
    var textFirstNumber: UITextField!
    var textSecondNumber: UITextField!

    // Create 4 buttons
    var buttonAdd: UIButton!
    var buttonSubtract: UIButton!
    var buttonMultiply: UIButton!
    var buttonDivide: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up UI elements
        setlabelTitle()
        
        settextFirstNumber()
        settextSecondNumber()
    
        setlabelOperation()
        
        setupButtonAdd()
        setupButtonDivide()
        setupButtonMultiply()
        setupButtonSubtract()
        
        //Add actions to 4 buttons
        buttonAdd.addTarget(self,
                    action: #selector(onButtonAdd),
                    for: .touchUpInside)
        buttonSubtract.addTarget(self,
                    action: #selector(onButtonSubtract),
                    for: .touchUpInside)
        buttonMultiply.addTarget(self,
                    action: #selector(onButtonMultiply),
                    for: .touchUpInside)
        buttonDivide.addTarget(self,
                    action: #selector(onButtonDivide),
                    for: .touchUpInside)
        
        //Set up result label
        setlabelResult()
    
        initConstraints()
    }
    
    // MARK: Set 3 Labels attributes
    func setlabelTitle() {
        labelTitle = UILabel()
        labelTitle.text = "Basic Calculator"
        // Text size of the top Label should be larger than the text in other elements.
        labelTitle.font = UIFont.systemFont(ofSize: 26)
        labelTitle.textAlignment = .center
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelTitle)
    }
    
    func setlabelOperation() {
        labelOperation = UILabel()
        labelOperation.text = "Operations"
        labelOperation.font = UIFont.systemFont(ofSize: 20)
        labelOperation.textAlignment = .center
        labelOperation.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelOperation)
    }
    
    func setlabelResult() {
        labelResult = UILabel()
        labelResult.text = "Result"
        // Text in the resulting Label should be bold.
        labelResult.font = UIFont.boldSystemFont(ofSize: 20)
        labelResult.textAlignment = .center
        labelResult.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelResult)
    }
    
    // MARK: Set 2 TextFields attributes
    func settextFirstNumber() {
        textFirstNumber = UITextField()
        textFirstNumber.placeholder = "First Number"
        textFirstNumber.borderStyle = .roundedRect
        // TextFields should only accept numbers
        textFirstNumber.keyboardType = .decimalPad
        textFirstNumber.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textFirstNumber)
    }
    
    func settextSecondNumber() {
        textSecondNumber = UITextField()
        textSecondNumber.placeholder = "Second Number"
        textSecondNumber.borderStyle = .roundedRect
        // TextFields should only accept numbers
        textSecondNumber.keyboardType = .decimalPad
        textSecondNumber.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textSecondNumber)
    }
    
    //MARK: Set 4 buttons attributes
    func setupButtonAdd(){
        buttonAdd = UIButton(type: .system)
        buttonAdd.setTitle("Add", for: .normal)
        buttonAdd.tintColor = .systemBlue
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonAdd)
    }
    
    func setupButtonSubtract(){
        buttonSubtract = UIButton(type: .system)
        buttonSubtract.setTitle("Subtract", for: .normal)
        buttonSubtract.tintColor = .systemBlue
        buttonSubtract.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonSubtract)
    }
    
    func setupButtonMultiply(){
        buttonMultiply = UIButton(type: .system)
        buttonMultiply.setTitle("Multiply", for: .normal)
        buttonMultiply.tintColor = .systemBlue
        buttonMultiply.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonMultiply)
    }
    
    func setupButtonDivide(){
        buttonDivide = UIButton(type: .system)
        buttonDivide.setTitle("Divide", for: .normal)
        buttonDivide.tintColor = .systemBlue
        buttonDivide.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonDivide)
    }
    
    //MARK: Initialize constraints
    func initConstraints(){
        NSLayoutConstraint.activate(
            [
                // Constraints for labelTitle
                labelTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
                labelTitle.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                // Constraints for 2 text feilds
                textFirstNumber.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 24),
                textFirstNumber.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                textSecondNumber.topAnchor.constraint(equalTo: textFirstNumber.bottomAnchor, constant: 16),
                textSecondNumber.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                textFirstNumber.leadingAnchor.constraint(equalTo: textSecondNumber.leadingAnchor),
                textFirstNumber.trailingAnchor.constraint(equalTo: textSecondNumber.trailingAnchor),
                
                // Constraints for label Operation
                labelOperation.topAnchor.constraint(equalTo: textSecondNumber.bottomAnchor, constant: 24),
                labelOperation.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                // Constraints for buttons
                buttonAdd.topAnchor.constraint(equalTo: labelOperation.bottomAnchor, constant: 16),
                buttonAdd.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                buttonSubtract.topAnchor.constraint(equalTo: buttonAdd.bottomAnchor, constant: 12),
                buttonSubtract.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                buttonMultiply.topAnchor.constraint(equalTo: buttonSubtract.bottomAnchor, constant: 12),
                buttonMultiply.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                buttonDivide.topAnchor.constraint(equalTo: buttonMultiply.bottomAnchor, constant: 12),
                buttonDivide.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                // Constraints for results
                labelResult.topAnchor.constraint(equalTo: buttonDivide.bottomAnchor, constant: 24),
                labelResult.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
  
            ]
        )
    }
    
    //MARK: Set 4 buttons tap action...
    @objc func onButtonAdd(){
        if let numbers = parseInputValues() {
            setResult(result:numbers[0] + numbers[1])
        }
    }
    
    @objc func onButtonSubtract(){
        if let numbers = parseInputValues() {
            setResult(result:numbers[0] - numbers[1])
        }
    }
    
    @objc func onButtonMultiply(){
        if let numbers = parseInputValues() {
            setResult(result:numbers[0] * numbers[1])
        }
    }
    
    @objc func onButtonDivide(){
        if let numbers = parseInputValues() {
            // Handle edge case when divisor is 0
            if (numbers[1] == 0) {
                presentAlert(message: "Divisor cannot be 0!")
            } else {
                setResult(result:numbers[0] / numbers[1])
            }
        }
    }
    
    //MARK: Helper methods
    func presentAlert(message: String) {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    // Reference: https://stackoverflow.com/questions/44732044/swift-textfield-and-value-validation
    func validateInputValues() -> Bool {
        /* If a user forgets to put a value in any of the TextFields before tapping the operation buttons, display an alert saying, “Error! The numbers cannot be empty!”*/
        guard let firstText = textFirstNumber.text, !firstText.isEmpty,
              let secondText = textSecondNumber.text, !secondText.isEmpty
        else {
            presentAlert(message: "The numbers cannot be empty!")
            return false
        }
        /* If the inputs are invalid, display the alert */
        guard Double(firstText) != nil, Double(secondText) != nil else {
            presentAlert(message: "Please enter valid numbers!")
            return false
        }
        return true
    }
    
    func parseInputValues() -> [Double]? {
        if !validateInputValues() {
            return nil;
        }
        return [Double(textFirstNumber.text!)!, Double(textSecondNumber.text!)!]
    }
    
    func setResult(result:Double) {
        // Handle the case when output should be int
        // Reference: https://stackoverflow.com/questions/42724234/truncatingremainder-vs-remainder-in-swift
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            labelResult.text = "\(Int(result))"
        } else {
            labelResult.text = "\(result)"
        }
    }
}
