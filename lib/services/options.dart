import 'dart:io';

int selectedOption = 0;
int getUserInput(int maxOption) {
  do {
    stdout.write("Please enter your choice (0-${maxOption-1}): ");
    String? input = stdin.readLineSync();
    if (input == null || input.isEmpty) {
      print("No input provided. Please enter a valid number.");
      continue;
    }

    //! if the input cannot be parsed, it returns -1 as number and asks enters valid input 
    selectedOption = int.tryParse(input) ?? -1; 
    if (selectedOption < 0 || selectedOption > maxOption) {
      print("Invalid input. Please enter a number between 0 and ${maxOption - 1}.");
    }
  } while (selectedOption < 0 || selectedOption > maxOption);

  return selectedOption;
}
