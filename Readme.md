# WordScramble Game

## Overview

WordScramble is a fun and engaging word game that challenges players to create as many words as possible from a given root word. Designed with SwiftUI, this game not only tests your vocabulary and creativity but also provides an intuitive and interactive user experience. Perfect for language enthusiasts and puzzle solvers alike, WordScramble is a great way to pass time while exercising your brain.

## Getting Started

To run **WordScramble**, you'll need to have Xcode installed on your Mac. The game is not distributed on the App Store, so you'll run it using the Xcode simulator or directly on your device. Here's how to get started:

### Prerequisites

- macOS with the latest version of Xcode installed.
- An Apple Developer account, if you wish to run the game on a physical device.

### Installation

1. **Clone the Repository**

   Open Terminal and clone the repository to your local machine:
   
   ```bash
   git clone https://github.com/dimdal/wordscramble.git
   ```
   

2. **Open the Project in Xcode**

Navigate to the cloned repository folder, and open the project file (`WordScramble.xcodeproj`) in Xcode:

```bash
cd VikingBrainTraining
open WordScramble.xcodeproj
```

3. **Choose the Simulator or Device**

In Xcode, select the target device from the scheme dropdown menu at the top of the window. You can choose either a simulator or a physical device connected to your Mac.

4. **Run the Game**

Click the "Run" button (the play icon) in the top left corner of Xcode. Xcode will build the project and run the game on your chosen simulator or device.

### Running on a Physical Device

To run the game on a physical iOS device:

1. Connect your device to your Mac via USB.
2. Select your device from the scheme dropdown menu in Xcode.
3. You may need to trust the developer certificate on your device by going to `Settings > General > Device Management` on your iOS device.
4. Click the "Run" button in Xcode to install and launch the game on your device.

## How to Play

At the start of the game, a root word is displayed at the top of the screen. Your task is to form new words using the letters from this root word. Each new word you create earns you points, with longer words scoring more points. The game encourages you to stretch your vocabulary as you scramble to find all possible word combinations.

### Game Features

- **Interactive Word Input:** Enter your words using a simple text field. The game checks your input for validity and originality.
- **Dynamic Word List:** See a list of the words you've successfully created, each accompanied by a unique icon indicating its length.
- **Scoring System:** Earn points for each new word based on its length. Challenge yourself to beat your high score by finding longer words or more unique combinations.
- **Swipe to Refresh:** Swipe left on the root word to change it and start a new round of word scrambling. This allows for endless gameplay, with each new word presenting a fresh challenge.
- **Helpful Animations:** Enjoy smooth transitions and animations as new words appear and as you interact with the game.

### Rules

1. **Word Length:** Words must be at least 3 characters long.
2. **Originality:** You cannot use the same word more than once.
3. **Relevance:** Words must be formed from the letters of the root word. Rearranging the root word itself is not allowed.
4. **Real Words:** The game uses a dictionary to verify that your words exist. Make-believe words won't count.

### How to Start

1. Launch the game to see a randomly selected root word.
2. Use the text field to enter a word, then submit it.
3. If the word is valid, it will appear in your list of used words, and you'll receive points based on its length.
4. To get a new root word, simply swipe left on the current word.

### Troubleshooting

If you encounter any issues or the game fails to load a new root word, make sure you have a stable internet connection or restart the game. The game's word list is embedded within the app, ensuring availability even offline.

## Conclusion

WordScramble offers a simple yet captivating gameplay experience for those who love word games. With its intuitive interface and challenging mechanics, it's a perfect game to improve your vocabulary in a fun way. Give it a try and see how many words you can scramble!

## Credits
Thanks to Martin Lindhe for the alphabetically sorted text file of Swedish words.
https://github.com/martinlindhe/wordlist_swedish

Thanks to [HackingWithSwift](https://www.hackingwithswift.com/100/swiftui) for helpful SwiftUI tutorials. 
