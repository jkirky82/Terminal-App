# Terminal App

## Software Development Plan

### What Will the Application Do

The application is a turn based RPG. The user will have a couple of options on how to fight an enemy, based on user input that they can select from a list of options that will be displayed with a gem called tty prompt.
The user will get to select a class and list of abilites for that class and also a weapon.

### Identify the problem it will solve and explain why you are developing it

### Identify the target audience

The target audience is people who like to play games and friends. Since its a game an obvious answer is someone that enjoys playing games or friends that I want to display my game to.

### Explain how a member of the target audience will use it

The user will run the applicatin on terminal and will have to input using the ruby gem tty prompt to select what attack, skill, potions they would like ot used to take down different enemies.

## Features

### Character Creation

The user will have to input their characters name and age and also select from a list of classes which allows them to select 3 skills from a small list of skills.

### Combate

User will fight an enemie (maybe multiple at a time) in a turn based attack system, you will have an attack, skills and potions option that will help deal damange to the enemie who has a hp bar just like you whos ever health points drops to 0 first loses.

### Inbetween Combate

Users will select options on the direction they want to go and will be able to collect other weapons and select which they would like to equip.

## Develop an outline of the user interaction and experience for the application

### how the user will find out how to interact with / use each feature

The Game will have very easy to follow prompts for the character selection that will output a message when the user has incorrectly inputed something.
A quick overview/descriotion will display of each of the different combate option: attack, abilites, potions. They will also be in tty prompt to make the code less typed user input so there are less errors through the program.

### How the user will interact

As said before the user will you predominantly use tty prompt for less user input errors and error checking, the user will still have to use text based input in the character creation and when inputing or saving a file.

### How errors will be handled by the application and displayed to the user

When user has to type input ever input will have to be check that it is the correct datat type by putting it a number validation or a string validation. If the input is incorrect the user will be notted that it is incorrect and  will prompt for a re input of the number or string and whill continue this loop untill it has been inputed correctly.
