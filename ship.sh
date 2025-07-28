#!/bin/bash
# Ship Management System
# Files to store the ship and port details
SHIP_FILE="ships.txt"
PORT_FILE="ports.txt"

# Function to add a new ship with validation
add_ship() {

# Ship Name input with validation
while true; do
echo "Enter Ship Name: "
read ship_name
[[ -z "$ship_name" ]] && echo "Ship name cannot be empty." || break
done

   
# Ship Type input validation
while true; do
echo "Enter Ship Type"
read ship_type
[[ -z "$ship_type" ]] && 
echo "Ship type cannot be empty." || break
    done

# Ship Capacity input with validation
 while true; do
echo "Enter Ship Capacity: "
read ship_capacity
if [[ ! "$ship_capacity" =~ ^[0-9]+$ ]]; then
echo "Capacity must be a positive integer."
else
 break
 fi
done

  # Append the ship details to the file
echo "$ship name | $ship type | $ship capacity" >> $SHIP_FILE
echo "Ship add successfully!"
}

# Function to view all ships
view ships () {
    if [ -s $SHIP_FILE]; then
    echo "Listing all ships:"
    cat $SHIP_FILE
    else
    echo "No ships available."
    fi
}


# Function to search for a ship by name
search_ship() {
echo "Enter Ship Name to search: "
 read search_name
 grep -i "$search_name" $SHIP_FILE
 if [ $? -ne 0 ]; then
  echo "Ship not found."
    fi
}

# Function to delete a ship
delete_ship() {
echo "Enter Ship Name to delete: "
 read delete_name
grep -v -i "$delete_name" $SHIP_FILE > temp.txt && mv temp.txt $SHIP_FILE
echo "Ship deleted if it existed."   }

# Function to add a new port with validation
add_port() {
while true; do
echo "Enter Port Name: "
read port_name
[[ -z "$port_name" ]] &&
 echo "Port name cannot be empty." || break
done
while true; do
echo "Enter Port Location: "
read port_location
[[ -z "$port_location" ]] && echo "Port location cannot be empty." || break
    done

 
   # Append the port details to the file
echo "$port_name | $port_location" >> $PORT_FILE
echo "Port added 
successfully!"
}


# Function to view all ports
view_ports() {
  if [ -s $PORT_FILE ]; then
 echo "Listing all ports:"
 cat $PORT_FILE
    else
       echo "No ports available."
    fi
}




# Function to delete a port
delete_port () {
echo"Enter Port Name delete "
read delete_port_name
grep -v -i "$delete_port_name" $PORT_FILE > temp.txt && mv temp.txt $PORT_FILE
echo "Port deleted if it existed."
}

# Main menu function
menu() {
    echo "Ship Management System"
    echo "1. Add Ship"
    echo "2. View Ships"
    echo "3. Search Ship"
    echo "4. Delete Ship"
    echo "5. Add Port"
    echo "6. View Ports"
    echo "7. Delete Port"
    echo "8. Exit"
}

# Main program loop
while true; do
 menu
 echo "Enter your choice: "
  read choice
    case $choice in
     1) add_ship ;;
      2) view_ships;;
       3) search_ship;;
       4) delete_ship;;
        5)add_port;;
        6)view_ports;;
        7) delete_port ;;
         8) echo "Exiting the       Ship Management System."
            exit 0;;
echo "Invalid option. Please try again.";;
    esac
done
