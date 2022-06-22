# Hangman Game 
# Alana McPhail 
# June 22, 2022

# Github: https://github.com/alanamcphail22/Hangman

# Packages used 
library(readr)

# Prepare dictionary of words to choose from and save it in a txt file 
# writing dictionary of words
dictionary <- data.frame(x = c("boat", "jumbo", "laundry", "hollow", "giraffe",
                               "explode", "toast", "mediocre", "cleanse", "awesome",
                               "coffee", "basil", "garden", "airplane", "digital",
                               "health", "technology", "coding", "oat", "icecream"))

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

print(paste("Secret word has", letters, "letters.", "You are allowed 6 wrong guesses. Good luck!"))


# inform user about the number of wrong number of guesses/tries allowed 



# ask for user input - one character only 

guess <- readline("Guess a letter! ")
if(nchar(guess) > 1){
  print("Too many letters. Guess again")
} else if(grepl(guess, "abcdefghijklmnopqrstuvwxyz", ignore.case = T) == F) {
  print("invlad")
} else {
  print("valid")
}
  
