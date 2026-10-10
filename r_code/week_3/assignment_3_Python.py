## Assignment 3
# Kristien Paschold


#Python1

# Import module datatime
from datetime import datetime

# Extract current hour from system and save as integer
current_hour = int(datetime.now().time().strftime("%H"))

# Print messages depending on current time
if current_hour in list(range(0, 5)):  # between 12am and 5am
    print("Go to sleep!")
elif current_hour in list(range(7, 12)):  # between 7am and 12pm 
    print("Eat Breakfast!")
else:  # otherwise:
    print("Hang out on your phone!")



#Python2

# Import module numpy and warnings
import numpy as np
import warnings as warnings

# Definition for printing unique values of np vector
def special(vec):

    # Only proceed if vec is np.ndarray
    if isinstance(vec, np.ndarray):

        # Empty list for future unique values
        unique_values = []
        
        # Append value if it is not in unique_values yet
        for i in vec:
            if i not in unique_values:
                unique_values.append(int(i))

        # Warning if all values of vec are unique
        if len(vec) == len(unique_values):
            warnings.warn("All values are special!")

        # Print all unique values
        print(unique_values)
    else:
        # Raise exception if vec is not np.darray
        raise Exception("This function only works with Numpy ndarray.")



#Python3

# Try blocks allow for testing code for errors
def check_input(operation):
    try:
        print(operation())
    except TypeError:
        print("This input is invalid. Try again.")
# Operation argument needs to be in this format: lambda: <operation>



#Python4

# Definition for testing for strong password
def is_strong_password(password):

    # Condition: Password must be at least 10 characters long
    condition_length = len(password) >= 10

    # Condition: Password must contain at least one number
    condition_numbers = any(char.isdigit() for char in password)

    # Assertion errors if conditions are not met
    assert condition_length, "Password must contain at least 10 characters"
    assert condition_numbers, "Password must contain a number"

    # Give positive feedback if conditions are met
    if (condition_length and condition_numbers):
        print("That is a strong password!")