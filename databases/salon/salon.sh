#!/bin/bash

# Salon Script

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

# TRUNCATED=$($PSQL "TRUNCATE customers, services, appointments;")

# DEFAULT_SERVICES=$($PSQL "insert into services(service_id, name) values(1, 'Taper Fade'), (2, 'Corn Rows'), (3, 'Twists'), (4, 'Buzz Cut'), (5, 'Line Up'), (6, 'Enhancement')")

echo -e "\n==== Willy's Hair & Care ====\n"

echo -e "What can we help you with today?\n"

SERVICES=$($PSQL "select * from services")

DISPLAY_SERVICES() {
  if [[ ! -z $1 ]]
    then
    echo -e "\nError: $1"
  fi

  echo "$SERVICES" | while IFS="|" read SERVICE_ID SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
    DISPLAY_SERVICES "Please enter a valid number from the list:\n"
  else
    SELECTED_SERVICE_NAME=$($PSQL "select name from services where service_id='$SERVICE_ID_SELECTED'")

    if [[ -z $SELECTED_SERVICE_NAME ]]
      then
      DISPLAY_SERVICES "Please enter a valid number from the list:\n"
    else
      # echo $SELECTED_SERVICE_NAME
      echo -e "\nPlease enter your phone number in the format XXX-XXXX:"
      read CUSTOMER_PHONE

      # while [[ ! CUSTOMER_PHONE =~ [0-9]{3}-[0-9]{4} ]]
      #  do
      #   echo -e "\nPlease enter your phone number in the format XXX-XXXX:"
      #   read CUSTOMER_PHONE
      # done

      CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")

      if [[ -z $CUSTOMER_NAME ]]
      then
        echo -e "\nPlease enter your name:"
        read CUSTOMER_NAME
        NEW_CUSTOMER=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      fi

      CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")

      echo -e "\nPlease enter an appointment time in the format HH:MM"
      read SERVICE_TIME

      NEW_APPOINTMENT=$($PSQL "insert into appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

      echo -e "I have put you down for a $SELECTED_SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi
}

DISPLAY_SERVICES