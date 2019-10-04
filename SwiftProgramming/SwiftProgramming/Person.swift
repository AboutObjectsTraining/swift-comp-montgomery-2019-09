// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//

// Implementation of Equatable protocol
//
//func ==(lhs: Friendable, rhs: Friendable) -> Bool {
//    return lhs.friendID == rhs.friendID
//}

// MARK: - Likeable Protocol

/// Provides methods and properties that determine likeability
protocol Likeable
{
    // MARK: Property Declaration
    var numberOfLikes: Int { get }
    
    // MARK: Method Declarations
    func like()
    func unlike()
}

// MARK: - Friendable Protocol
protocol Friendable
{
    // MARK: Property Declarations
    var friendID: Int { get }
    var friends: [Friendable] { get }
    
    // MARK: Method Declarations
    func friend(_ newFriend: Friendable)
    func unfriend(_ oldFriend: Friendable)
}

//extension Friendable
//{
//    mutating func friend(_ newFriend: Friendable) {
//        friends.append(newFriend)
//    }
//
//    mutating func unfriend(_ oldFriend: Friendable) {
//        friends = friends.filter { return $0.friendID != oldFriend.friendID }
//    }
//}

// MARK: - Person Class
class Person: CustomDebugStringConvertible
{
    // MARK: Person Properties
    var firstName: String
    var lastName: String
    
    // MARK: Likeable Properties
    var numberOfLikes = 0
    
    // MARK: Friendable Properties
    var friendID = 0
    var friends: [Friendable] = []
    
    // MARK: CustomDebugStringConvertible Properties
    var debugDescription: String {
        return "\(firstName) \(lastName), +\(numberOfLikes)"
    }
    
    // MARK: - Initializers
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

// MARK: - Person's Likeable Methods
extension Person: Likeable
{
    func like() {
        numberOfLikes += 1
    }
    
    func unlike() {
        if (numberOfLikes > 0) {
            numberOfLikes -= 1
        }
    }
}

// MARK: - Person's Friendable Methods
extension Person: Friendable
{
    func friend(_ newFriend: Friendable) {
        friends.append(newFriend)
    }
    
    func unfriend(_ oldFriend: Friendable) {
        var index = -1
        for (currIndex, friend) in friends.enumerated() {
            if friend.friendID == oldFriend.friendID {
                index = currIndex
            }
        }
        
        if index > -1 {
            friends.remove(at: index)
        }
    }
    
    func unfriend2(_ oldFriend: Friendable) {
        friends = friends.filter { currFriend in
            currFriend.friendID != oldFriend.friendID
        }
    }
    
    func unfriend3(_ oldFriend: Friendable) {
        let index = friends.firstIndex { oldFriend.friendID == $0.friendID }

        if index == nil { return }
        friends.remove(at: index!)
    }
}
















