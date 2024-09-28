//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Kate on 11/02/2024.
//

import SwiftUI

// viewModel
class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
        
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 3) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
            
        }
    }
    
    
    
   @Published private var model = createMemoryGame() // in the assignement "model" should be renamed, like "game"
    
    var cards: Array<Card> {
        return model.cards
    }
    
    var color: Color {
        return .orange
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
