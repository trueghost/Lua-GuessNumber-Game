-- Function to generate a random number within a specified range
function generateRandomNumber(min, max)
    return math.random(min, max)  -- Use math.random to get a random number between min and max (inclusive)
end

-- Function to get user input as a number
function getUserInput(prompt)
    io.write(prompt)        -- Print the prompt to the console
    return tonumber(io.read())  -- Read user input and convert it to a number (tonumber converts input to a number or nil if not a number)
end

-- Main function for the guessing game
function guessingGame()
    local minRange = 1          -- Define the minimum value for the random number range
    local maxRange = 100        -- Define the maximum value for the random number range
    local targetNumber = generateRandomNumber(minRange, maxRange)  -- Generate a random number between minRange and maxRange
    local maxAttempts = 10      -- Define the maximum number of attempts the user has to guess the number
    local attempts = 0          -- Initialize the variable to track the number of attempts made by the user

    print("Welcome to the Guessing Game!")  -- Display a welcome message to the user
    print("I have picked a random number between " .. minRange .. " and " .. maxRange)  -- Display the range of the random number
    print("You have " .. maxAttempts .. " attempts to guess it.")  -- Display the number of attempts the user has

    -- Loop to keep asking the user for guesses until the maximum attempts are reached
    while attempts < maxAttempts do
        local guess = getUserInput("Enter your guess: ")  -- Prompt the user to enter a guess and store it in the 'guess' variable

        if guess == targetNumber then  -- Check if the user's guess is equal to the target number
            print("Congratulations! You guessed the correct number!")  -- Display a success message and end the game
            return
        elseif guess < targetNumber then  -- Check if the user's guess is lower than the target number
            print("Too low! Try again.")  -- Display a message indicating the guess is too low
        else  -- If the guess is neither correct nor too low, it must be too high
            print("Too high! Try again.")  -- Display a message indicating the guess is too high
        end

        attempts = attempts + 1  -- Increment the number of attempts made by the user
    end

    -- If the loop ends (after maximum attempts are used), display the correct number and end the game
    print("Sorry, you have run out of attempts. The correct number was " .. targetNumber)
end

-- Run the guessing game by calling the main function
guessingGame()
