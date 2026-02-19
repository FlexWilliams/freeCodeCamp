PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

DISPLAY_INFO_BY_ATOMIC_NUM() {
  ELEMENT_BY_ATOMIC_NUM=$($PSQL "select symbol, name from elements where atomic_number=$1")

  if [[ -z $ELEMENT_BY_ATOMIC_NUM ]]
      then
      echo I could not find that element in the database.
    else
        SYMBOL=$(echo $ELEMENT_BY_ATOMIC_NUM  | sed -E 's/\|.*//')
        NAME=$(echo $ELEMENT_BY_ATOMIC_NUM  | sed -E 's/.*\|//')
        MASS=$($PSQL "select atomic_mass from properties where atomic_number=$1")
        MELTING_POINT=$($PSQL "select melting_point_celsius from properties where atomic_number=$1")
        BOILING_POINT=$($PSQL "select boiling_point_celsius from properties where atomic_number=$1")
        TYPE_ID=$($PSQL "select type_id from properties where atomic_number=$1")
        TYPE=$($PSQL "select type from types where type_id=$TYPE_ID")

        echo -e "The element with atomic number $1 is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
}

DISPLAY_INFO_BY_SYMBOL_OR_NAME() {
  ATOMIC_NUM=$($PSQL "select atomic_number from elements where symbol='$1' or name='$1'")

  if [[ -z $ATOMIC_NUM ]]
    then
    echo I could not find that element in the database.
  else
    DISPLAY_INFO_BY_ATOMIC_NUM $ATOMIC_NUM
  fi
}

if [[ -z $1 ]]
  then
    echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
    then
      DISPLAY_INFO_BY_ATOMIC_NUM $1
  else
    DISPLAY_INFO_BY_SYMBOL_OR_NAME $1
  fi
fi