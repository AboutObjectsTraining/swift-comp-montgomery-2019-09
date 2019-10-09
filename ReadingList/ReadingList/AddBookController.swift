// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

class AddBookController: UITableViewController
{
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    
    var addBook: ((Book) -> Void)?
    
    var authorInfo: JsonDictionary {
        return [Author.Keys.firstName: firstNameField.text ?? "",
                Author.Keys.lastName: lastNameField.text ?? ""]
    }
    
    var bookInfo: JsonDictionary {
        return [Book.Keys.title: titleField.text ?? "",
                Book.Keys.year: yearField.text ?? "",
                Book.Keys.author: authorInfo]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Done" {
            addBook?(Book(dictionary: bookInfo))
        }
    }
}
