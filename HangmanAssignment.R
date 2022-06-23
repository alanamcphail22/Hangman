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

# read the word list from your program 

words <- read_tsv("dictionary.txt", show_col_types = F, col_names = F)

# choose a random element from the list 

# setting words as a vector of the list of words
words <- as.vector(words$X1)

# choosing a random word from the list 
secretWord <- words[sample(1:length(words), 1)]


# infrom the use on the length of the secret word (may test nchar() )
letter <- nchar(secretWord)

guessedLetters <- "letters:"

guessesLeft <- 6

print(paste("The secret word has", letter, "letters.", "You are allowed 6 wrong guesses. If you want to leave
            the game type 'exit'. Good luck!"))

Sys.sleep(5)
# inform user about the number of wrong number of guesses/tries allowed 

emptyWord <- nchar(secretWord)

# ask for user input - one character only 

while(guessesLeft > 0 ) {
  guess <- readline("Guess a letter! ")
  if(guess == "exit") {
    break
  }
    else if(nchar(guess) > 1) {
      print("too many letters. guess again.")
    } else if(grepl(guess, "abcdefghijklmnopqrstuvwxyz", ignore.case = T) == F) {
      print("Not a letter")
    } else {
      if(grepl(guess, secretWord, ignore.case = T)) {
        guessedLetters <- paste(guessedLetters, guess)
        print(paste(guessedLetters))
        print("in word")
        emptyWord <- emptyWord - 1
        if(emptyWord == 0) {
          print("Winner")
          break
        } 
      } else {
        guessesLeft <- guessesLeft - 1
        print(paste("No,", guessesLeft, "guesses left."))
        if(guessesLeft == 0) {
          print("Game Over")
        } 
      }
    }
  }









