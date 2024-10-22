//
//  ViewController.swift
//  Expense App
//
//  Created by Jiali Han on 10/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    let firstScreen = FirstScreenView()
    
    //MARK: expenses array to populate TableView...
    var expenses = [Expense]()
    
    //MARK: predefined types of expenses...
    let types = ["Groceries", "Rent", "Subscriptions", "Gadgets and Electronics"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Expense App"
        //MARK: adding dummy data for testing table view...
//        expenses.append(Expense(title: "Pixel 7 pro", amount: 750.0, type: types[3]))
//        expenses.append(Expense(title: "iPhone SE", amount: 349.0, type: types[3]))
//        expenses.append(Expense(title: "Target", amount: 150.0, type: types[0]))
//        expenses.append(Expense(title: "Netflix", amount: 19.0, type: types[2]))
        
        //MARK: manipulating TableView separator line...
        firstScreen.tableViewExpense.separatorStyle = .none
        
        //MARK: patching the table view delegate and datasource to controller...
        firstScreen.tableViewExpense.delegate = self
        firstScreen.tableViewExpense.dataSource = self
        
        
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
        
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
    }
    @objc func onAddBarButtonTapped(){
        let addExpenseController = AddExpenseViewController()
                addExpenseController.delegate = self
                navigationController?.pushViewController(addExpenseController, animated: true)
    }
    
    //MARK: Hide Keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    override func loadView() {
        view = firstScreen
    }
    
    //MARK: got the new expense back and delegated to ViewController...
    func delegateOnAddExpense(expense: Expense){
        expenses.append(expense)
        firstScreen.tableViewExpense.reloadData()
    }
    
}

//MARK: adopting the procols for TableView...
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    //MARK: returns the number of rows in the current section...
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    //MARK: populate a cell for the current row...
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // checks if it already has a reusable empty cell with the identifier provided. If yes, it will reuse that; else, it will create a new cell of that identifier.
        let cell = tableView.dequeueReusableCell(withIdentifier: "expenses", for: indexPath) as! TableViewExpenseCell
        cell.labelTitle.text = expenses[indexPath.row].title
        if let uwAmount = expenses[indexPath.row].amount{
            cell.labelAmount.text = "Cost: $\(uwAmount)"
        }
        if let uwType = expenses[indexPath.row].type{
            cell.labelType.text = "Type: \(uwType)"
        }
        //MARK: setting the image of the receipt...
        if let uwImage = expenses[indexPath.row].image{
            cell.imageReceipt.image = uwImage
        }
        return cell
    }
    
    //MARK: deal with user interaction with a cell...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.expenses[indexPath.row])
    }
}
