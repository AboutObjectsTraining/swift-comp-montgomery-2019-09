// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

class DataSource: NSObject
{
    @IBOutlet var storeController: ReadingListStore!
    private lazy var readingList: ReadingList = storeController.fetchedReadingList
    
    func book(at indexPath: IndexPath) -> Book {
        return readingList.book(at: indexPath)
    }
    
    func insert(book: Book, at indexPath: IndexPath) {
        readingList.insert(book: book, at: indexPath)
    }
    
    func removeBook(at indexPath: IndexPath) {
        readingList.removeBook(at: indexPath)
    }
    
    func save() {
        storeController.save(readingList: readingList)
    }
}

extension DataSource: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        removeBook(at: indexPath)
        save()
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        readingList.moveBook(at: sourceIndexPath, to: destinationIndexPath)
        save()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return readingList.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Book Summary") else {
            fatalError("Unable to dequeue a cell with identifier 'Book Summary'. Check identifier in storyboard.")
        }
        
        let book = readingList.book(at: indexPath)
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = "\(book.year ?? "----") \(book.author?.fullName ?? "Unknown")"
        
        return cell
    }
}
