// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

class ReadingListController: UITableViewController
{
    @IBOutlet var dataSource: DataSource!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let controller = segue.realDestination as? ViewBookController,
            let indexPath = tableView.indexPathForSelectedRow else { return }
        
        controller.book = dataSource.book(at: indexPath)
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
