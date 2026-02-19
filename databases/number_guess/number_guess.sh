#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# TRUNCATED=$($PSQL "truncate table user_games, users, games;")

echo -e "Enter your username:\n"

read USERNAME

USER=$($PSQL "select username from users where username = '$USERNAME'")

if [[ -z $USER ]]
then
  NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER=$($PSQL "select username from users where username = '$USERNAME'")
  echo "Welcome, $USER! It looks like this is your first time here."
else
  COUNT_AND_BEST_GAME=$($PSQL "select COUNT(*), MIN(guesses) from users inner join user_games using(username) inner join games using(game_id) where username='$USER'")
  GAMES_PLAYED=$(echo $COUNT_AND_BEST_GAME | sed -E 's/\|[0-9]+//')
  BEST_GAME=$(echo $COUNT_AND_BEST_GAME | sed -E 's/[0-9]+\|//')
  echo "Welcome back, $USER! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$(($RANDOM % 1001))
NEW_GAME=$($PSQL "INSERT INTO games (secret_number) VALUES($SECRET_NUMBER) RETURNING game_id")
NEW_GAME_ID=$(echo $NEW_GAME | sed -E 's/ INSERT.*//')

NEW_USER_GAME=$($PSQL "insert into user_games(username, game_id) VALUES('$USER', $NEW_GAME_ID)")

echo "Guess the secret number between 1 and 1000:"
read NUMBER

GUESSES=1

while [[ $NUMBER != $SECRET_NUMBER ]];
do
  GUESSES=$(($GUESSES + 1))
  
  if [[ ! $NUMBER =~ ^[0-9]+$ ]]; then
    echo That is not an integer, guess again:
    read NUMBER
  elif [[ $NUMBER > $SECRET_NUMBER ]]; then
    echo "It's lower than that, guess again:"
    read NUMBER
  else
    echo "It's higher than that, guess again:"
    read NUMBER
  fi
done

GAME_FINISHED=$($PSQL "UPDATE games set guesses=$GUESSES where game_id=$NEW_GAME_ID")

echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
