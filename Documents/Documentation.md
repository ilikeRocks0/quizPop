# Logic Layer

### Word editor Manager:
controls the deletion and updating words from a repository

### Word List manager:
manages the reading of items in a repository

### word Manager:
Has functions that check if the word is valide or not
This is passed to controllers for input checking

# Presentation Layer
### Pages:
Pages are what the app can show to the user, they are screens with meta data. Screens are used for the navigation manager

Page Descriptor:
is the struct that contains all the info needed for the bottom nav bar

Page Factories:
stores a widget with the neccessary meta data for the bottom navigation bar

Page factory:
is the factory that makes all the main pages for the bottom navigation bar
this doesnt include the word display page since it can only be accessed through the word display screen


### Screens:
Screens hold the css styling and the order the widgets are layed out for each screen.


### Widgets
These are what the screens can contain to do complex logic, each contains the formatting and there respective controllers

* word display 
Shows the words title and description, as well as the edit and delete options

* word form
Is a form that lets you add new words to a repository

* words view
views a word list based on the words in the repository

### Other
Modal Manager:
Pop up manager that brings up a yes/no are you sure pop up

Navigation Manager:
displays what screen is currently showing
SubScreen is always shown if there exists one