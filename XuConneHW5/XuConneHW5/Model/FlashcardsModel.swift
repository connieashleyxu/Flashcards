//
//  FlashcardsModel.swift
//  XuConneHW5
//
//  Created by Connie Xu on 10/12/21.
//

import Foundation

class FlashcardsModel: NSObject, FlashcardsDataModel {
    //priv var decl
    var flashcards: [Flashcard]!
    private var currentIndex: Int?
    
    //var decl
    var questionDisplayed: Bool!
    
    //init
    override init() {
        flashcards = []
        flashcards.append(Flashcard(question: "What is 1+1?", answer: "2"))
        flashcards.append(Flashcard(question: "What is 2+2?", answer: "4"))
        flashcards.append(Flashcard(question: "What is 3+3?", answer: "6"))
        flashcards.append(Flashcard(question: "What is 4+4?", answer: "8"))
        flashcards.append(Flashcard(question: "What is 5+5?", answer: "10"))
        
        currentIndex = 0
    }
    
    // class named "FlashcardsModel" implements
    // methods required in "FlashcardsDataModel" protocol:
    // Swift Singleton pattern
    static let sharedInstance = FlashcardsModel()
    
    // Returns number of flashcards in model
    func numberOfFlashcards() -> Int {
        return flashcards.count
    }
    
    // Returns a flashcard – sets currentIndex appropriately
    func randomFlashcard() -> Flashcard? {
        var rand: Int!
        rand = currentIndex
        while rand == currentIndex {
            rand = Int.random(in: 0..<flashcards.count)
        }
        currentIndex = rand
    
        return flashcards[currentIndex ?? 0]
    }
    
    //go to next flashcard
    func nextFlashcard() -> Flashcard? {
        currentIndex! += 1
        if currentIndex! >= flashcards.count {
            currentIndex! = 0
        }
        return flashcards[currentIndex!]
    }
    
    //go to prev flashcard
    func previousFlashcard() -> Flashcard? {
        currentIndex! -= 1
        if currentIndex! < 0 {
            currentIndex! = flashcards.count - 1
        }
        return flashcards[currentIndex!]
    }
    
    // Inserts a flashcard – sets currentIndex appropriately when inserting to certain positions
    func insert(question: String,
                answer: String,
                favorite: Bool) {
        let insertFlash = Flashcard(question: question, answer: answer, isFavorite: favorite)
        flashcards.append(insertFlash)
    }
    
    func insert(question: String,
                answer: String,
                favorite: Bool,
                at index: Int) {
        let insertFlash = Flashcard(question: question, answer: answer, isFavorite: favorite)
        if index <= flashcards.count && index >= 0 {
            flashcards.insert(insertFlash, at: index)
        }
    }
    
    // Returns the current flashcard at currentIndex
    func currentFlashcard() -> Flashcard? {
        return flashcards[currentIndex!]
    }
    
    //Returns a card at a given index
    func flashcard(at index: Int) -> Flashcard? {
        currentIndex = index
        return flashcards[currentIndex!]
    }
    
    // Removes a flashcard – sets currentIndex appropriately when removing from certain positionss
    func removeFlashcard(at index: Int) {
        if index < flashcards.count && index >= 0{
            flashcards.remove(at: index)
        }
    }
    
    // Favorite/unfavorite the current flashcard
    func toggleFavorite() {
        flashcards[currentIndex!].isFavorite = !flashcards[currentIndex!].isFavorite
    }
    
    // Returns the favorite flashcards from your flashcards
    func favoriteFlashcards() -> [Flashcard] {
        var favFlashcards: [Flashcard]! = []
        
        for flashcard in flashcards {
            if flashcard.isFavorite {
                favFlashcards.append(flashcard)
            }
        }
        return favFlashcards
    }
}
