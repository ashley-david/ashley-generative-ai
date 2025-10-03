import random;

node Game { 
    has options: list[str] = ["rock", "paper", "scissors"]; 
    has computer_choice: str = options[random.randint(0, 2)]; 
    has player: str = "";
}   

walker play_game {
    root {
        print("Welcome to Rock-Paper-Scissors!");
        with entry : Game;
        entry.init();

        while(true) {
            player = "";
            while (player not in entry.options) {
                player = input("Enter a choice (rock, paper, scissors): ");
            }

            computer = choice(entry.options);

            print("Player: ", player);
            print("Computer: ", computer);

            if (player == computer) {
                print("It's a tie!");
            } elif (player == "rock" and computer == "scissors") {
                print("You win!");
            } elif (player == "paper" and computer == "rock") {
                print("You win!");
            } elif (player == "scissors" and computer == "paper") {
                print("You win!");
            } else {
                print("You lose!");
            }

            again = input("Play again? (y/n): ");
            if (again != "y") {
                print("Thanks for playing!");
                break;
            }
        }
    }
}

with entry: __main__ {
    root spawn play_game;
}