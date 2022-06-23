# Hangman Game 
# Alana McPhail 
# June 22, 2022

# Github: https://github.com/alanamcphail22/Hangman

# Packages used 
library(readr)
library(stringr)

# Prepare dictionary of words to choose from and save it in a txt file 
# writing dictionary of words
dictionary <- data.frame(x = c("boat", "jumbo", "laundry", "half", "costly",
                               "exit", "mouse", "house", "earn", "power",
                               "beach", "basil", "garden", "around", "mount",
                               "arms", "phone", "coding", "oat", "purse"))

# saving dictionary to a txt file 
write_tsv(dictionary, file = "dictionary.txt", col_names = F)

# reading the word list 
words <- read_tsv("dictionary.txt", show_col_types = F, col_names = F)

# setting words as a vector of the list of words
words <- as.vector(words$X1)

# choosing a random word from the list 
secretWord <- words[sample(1:length(words), 1)]

# Assigning letter as the number of characters the secret word has.
letter <- nchar(secretWord)

# To be used later when showing the letters guessed
guessedLetters <- "letters:"

# Number of wrong guesses the player starts with
guessesLeft <- 6

# Printing the game rules along with the number of letters the word has
print(paste("The secret word has", letter, "letters.", "You are allowed 6 wrong guesses. If you want to leave
            the game type 'exit'. Good luck!"))

# Setting the system to sleep for 5 seconds so the player has time to read the rules. 
Sys.sleep(5)



# While loop runs while player has guesses left 
while(guessesLeft > 0 ) {
  # prompts user to guess a letter 
  guess <- readline("Guess a letter! ")
  # checks if guess is exit. quits the game. 
  if(guess == "exit") {
    break
  }
  # checks if guess is longer than one letter
    else if(nchar(guess) > 1) {
      # tells user there are too many letters and prompts another guess. 
      print("Too many letters. Guess again.")
      # checks to see that guess is an alphabetical letter
    } else if(grepl(guess, "abcdefghijklmnopqrstuvwxyz", ignore.case = T) == F) {
      # if it is not it prompts user to guess again.
      print("Not a letter. Guess again.")
    } else {
      # If guess is a single letter, it checks if it is in the secret word.
      if(grepl(guess, secretWord, ignore.case = T)) {
        # Adds correct letter to guessed letters
        guessedLetters <- paste(guessedLetters, guess)
        # prints all of the correct guesses 
        print(paste(guessedLetters))
        # tells the user the letter is in the word
        print("in word")
        # subtracts the amount of letters to guess from the word
        letter <- letter - 1
        # if all letters in the word have been guessed, player wins. 
        if(letter == 0) {
          print("Winner")
          break
        } 
        # If the guess is not in the secret word. 
      } else {
        # Subtracts one turn from the number of guesses
        guessesLeft <- guessesLeft - 1
        # Tells the user how many guesses they have left. 
        print(paste("No,", guessesLeft, "guesses left."))
        # If user runs out of guesses, the game is over. 
        if(guessesLeft == 0) {
          print("Game Over")
        } 
      }
    }
  }









