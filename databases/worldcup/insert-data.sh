#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# TRUNCATE TABLE games, teams;

TRUNCATED=$($PSQL "TRUNCATE TABLE games, teams")

echo -e "Truncated tables!\n"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ ! $YEAR == 'year' ]] # Skip first line
    then

    echo $YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS

    WINNER_TEAM_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    if [[ -z $WINNER_TEAM_ID ]]
    then
      INSERT_NEW_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      WINNER_TEAM_ID=$($PSQL "select team_id from teams where name='$WINNER'")
      echo $WINNER_TEAM_ID
    fi

    OPPONENT_TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    if [[ -z $OPPONENT_TEAM_ID ]]
    then
      INSERT_NEW_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      OPPONENT_TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
      echo $OPPONENT_TEAM_ID
    fi

    INSERT_NEW_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_TEAM_ID, $OPPONENT_TEAM_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    
  fi
done  