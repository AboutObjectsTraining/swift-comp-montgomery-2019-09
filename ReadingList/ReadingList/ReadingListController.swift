// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

class ReadingListController: UITableViewController
{
    @IBOutlet var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "View":
            guard
                let controller = segue.realDestination as? ViewBookController,
                let indexPath = tableView.indexPathForSelectedRow else {
                    fatalError("Unable to downcast the destination as an instance of \(ViewBookController.self)")
            }
            controller.book = dataSource.book(at: indexPath)
        case "Add":
            guard let controller = segue.realDestination as? AddBookController else {
                fatalError("Unable to downcast the destination as an instance of \(AddBookController.self)")
            }
            controller.addBook = { [weak self] book in self?.dataSource.insert(book: book, at: IndexPath.zero) }
        default: break
        }
    }
    
    // MARK: Unwind segues
    
    @IBAction func done(unwindSegue: UIStoryboardSegue) {
        tableView.reloadData()
        dataSource.save()
    }
    
    @IBAction func cancel(unwindSegue: UIStoryboardSegue) { }
}







// MARK: UITableViewDataSource methods
//
//extension ReadingListController
//{
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 100
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Book Summary")
////        if cell == nil {
////            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Foo")
////        }
//        
//        cell?.textLabel?.text = "Row \(indexPath.row + 1)"
//        
//        guard let unwrappedCell = cell else {
//            fatalError("Cell cannot be nil")
//        }
//        
//        return unwrappedCell
//    }
//}
