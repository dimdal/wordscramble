//
//  ContentView.swift
//  WordScramble
//
//  Created by Marius Ørvik on 18/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var currentWordScore: Int = 0
    @State private var isInstructionsExpanded = false // State to control the expansion of the instructions
    
    var body: some View {
        NavigationStack {
            
            List {
                Text(rootWord)
                    .foregroundStyle(Color("PrimaryColor"))
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center) // Center the text in the available space

                
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                        .padding() // Add padding for better touch targets
                        .background(Color("AccentColor").opacity(0.1)) // Slight background color for emphasis
                        .cornerRadius(5) // Rounded corners
                }
                
                Section("Score: \(currentWordScore)") {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle.fill")
                            Text(word)
                                .padding(.vertical, 2)
                        }
                        .foregroundStyle(Color("PrimaryColor"))
                        .font(.title3)
                    }
                }
            }
            .navigationTitle("🇸🇪 Word Scramble")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: refreshRootWord) {
                        Image(systemName: "arrow.clockwise")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: showHelp) {
                        Image(systemName: "questionmark.circle")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK") { }
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    func startGame() {
        // 1. Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "Swedish", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the string up into an array of strings, splitting on line breaks
                let allWords = startWords.components(separatedBy: "\n")
                
                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"
                
                // If we are here everything has worked, so we can exit
                return
            }
        }
        
        // If were are *here* then there was a problem – trigger a crash and report the error
        fatalError("Could not load start.txt from bundle.")
    }
    
    func addNewWord() {
        
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        guard answer.count > 2 else {
            wordError(title: "Word too short", message: "Words must be at least 3 characters")
            return
        }
        
        guard answer != rootWord else {
            wordError(title: "Word is same as root", message: "You can't use the same word as the root word.")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        // assign points based on length of word
        currentWordScore += answer.count
        
        newWord = ""
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "se")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func refreshRootWord() {
        currentWordScore = 0
        usedWords = []
        startGame()
    }
    
    func showHelp() {
        errorTitle = "How to play:"
        errorMessage = "Make new words from the word in the top. Longer words get more points. \n\n Press ↻ to get a new word"
        showingError = true
    }
    
}


#Preview {
    ContentView()
}
