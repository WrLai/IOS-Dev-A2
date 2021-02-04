//
//  ViewController.swift
//  Assignment2
//
//  Created by Weiren Lai on 2/2/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var x : Quotation?
    
    var quotationsAreHere = ["This is the first quotation","This isn't third quotation","This is third then"]
    var authorsAreHere = ["quote1","quote2","quote3"]
    
    var index = 0
    @IBOutlet weak var quoteTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var displayBoth: UILabel!
    
    
    
    @IBAction func addButtonForQuoteAndAuthor(_ sender: UIButton) {
        //add quotes and authors to the database
        let quotes = quoteTextField.text
        let authors = authorTextField.text
        
        
        let quotestemp = Quotation.init(quotesdb: quotes!, authorsdb: authors!)
        //Checking if the quote is empty, if it is
        //Don't add it
        if quotes!.isEmpty != true
        {
        if authors!.isEmpty == true{
            quotestemp.authorsdb = "Anonymous"
        }
        authorsAreHere.append(quotestemp.authorsdb)
        
        if quotes!.isEmpty == false {
            quotationsAreHere.append(quotestemp.quotesdb)
        }
        
        print(quotestemp.quotesdb, quotestemp.authorsdb)
        displayBoth.text = " \"\(quotestemp.quotesdb)\",\(quotestemp.authorsdb)"
        }
        else{
            showAlert()
            //checking if it gets to "else"
            //print("smt")
        }
        
        
        self.quoteTextField.text = nil
        self.authorTextField.text = nil
  
    }
    
    @IBAction func nextTappedButton(_ sender: UIButton) {
        //next quote and author
        
        if quotationsAreHere.isEmpty == false {
            index = (index + 1) % quotationsAreHere.count
            //check if it prints
            //print(quotationsAreHere[index])
            //print(authorsAreHere[index])
            displayBoth.text = "\"\(quotationsAreHere[index])\",\(authorsAreHere[index])"
        }
        
        
        
//        imageView.image = UIImage(named: images[index])
//        messageLabel.text = messages[index]
    }
    
    
    @IBAction func prevTappedButton(_ sender: UIButton) {
        //previous quote and author
        if quotationsAreHere.isEmpty == false {
            if index >= 1 {
                index = (index - 1 ) % quotationsAreHere.count
                //checking if it prints
                //print(quotationsAreHere[index])
                //print(authorsAreHere[index])
                displayBoth.text = "\"\(quotationsAreHere[index])\",\(authorsAreHere[index])"
            }
            else{
                index = quotationsAreHere.count
                index = (index - 1) % quotationsAreHere.count
                displayBoth.text = "\"\(quotationsAreHere[index])\",\(authorsAreHere[index])"

                
            }
            
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        quoteTextField.delegate = self
        authorTextField.delegate = self
        
        displayBoth.text = "\"\(quotationsAreHere[index])\", \(authorsAreHere[index])"
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        if let quotes = quoteTextField.text{
//            print(quotes)
//        }
//
//        if let authors = authorTextField.text{
//            print(authors)
//        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

    //User it when the user doesn't input
    func showAlert() {
        let alert = UIAlertController(title: "Invalid Input", message: "Please input a valid quote :)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "If you say so...", style: .default, handler:nil))
        present(alert, animated: true)
    }

}

