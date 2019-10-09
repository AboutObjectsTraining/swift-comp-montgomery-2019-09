// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

class ViewBookController: UITableViewController
{
    var book: Book?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleLabel.text = book?.title
        yearLabel.text = book?.year
        firstNameLabel.text = book?.author?.firstName
        lastNameLabel.text = book?.author?.lastName
    }

    // MARK: - Unwind segues
    @IBAction func cancel(unwindSegue: UIStoryboardSegue) { }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.realDestination as? EditBookController else { return }
        controller.book = book
    }
}
