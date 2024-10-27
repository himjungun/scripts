#!/bin/bash

# Function to calculate Kelly Criterion and EV
kelly_criterion() {
  win_prob=$(bc <<< "scale=2; $1 / 100")
  odds=$2

  kelly_pct=$(bc <<< "scale=2; ($odds * $win_prob - (1 - $win_prob)) / $odds * 100")

  ev=$(bc <<< "scale=2; $odds * $win_prob - (1 - $win_prob)")

  if (( $(bc <<< "$ev > 0") )); then
    ev_str="positive"
  else
    ev_str="negative"
  fi

  echo "Kelly Criterion: $kelly_pct%"
  echo "Expected Value (EV): $ev ($ev_str)"
}

# Get user input
read -p "Enter your expected win percentage (0-100): " win_pct
read -p "Enter the decimal odds of the bet: " odds

# Call the function
kelly_criterion $win_pct $odds
