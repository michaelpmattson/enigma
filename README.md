###  Battleship

## Table of contents
* [General info](#general-info)
* [Learning Goals](#learning-goals)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Status](#status)
* [Contact](#contact)

## General info
This project is a command line implementation of the game Battleship. Users can try their luck against a computer opponent. The program is place user and computer ships, display turns, and has an adjustable board size.

## Learning Goals
* Practice OOP
* Build classes that have specific roles
* Work with file i/o

## Technologies
Project is created with:
* Ruby version: 2.7.2

## Setup
To run this program, save a copy of this repository locally. In the MacOS
application 'Terminal,' navigate into the _enigma_ directory.
Save a message in the message.txt file. For code cracking, make sure to end message
with `' end'`. Several commands can be run from the command line.

1. Encrypt the text:
   ```
   $ ruby ./lib/encrypt.rb message.txt encrypted.txt
   ```
2. Decrypt the text:
   ```
   $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt <KEY> <DATE>
   ```
3. Crack the text:
   ```
   $ ruby ./lib/crack.rb encrypted.txt cracked.txt <DATE>
   ```

## Features
List of features ready and TODOs for future development
* __Enigma__ fully scrambles text and generates key and (today's) date.
* Text can also be returned without key.

To-do list:
* Crack method as of yet still has a bug that returns error / incorrect text
depending on encrypted text. Further iterations would solve this error.

## Self-evaluation
* Functionality - meets expectations. Encrypt and decrypt methods are working.
Cracked is below 100% functional, but near completion.
* Object oriented programming - meets expectations. Classes are logically structured.
No inheritence used, but not needed as is.
* Ruby convention and mechanics - meets expectations. Mostly properly structured.
Few enumerables used in logical places. Early iterations used hashes, but these were
removed in favor of using instance methods for attribute access.
* Test driven development - meets/above expectations. 100% coverage metrics.
Stubs used in proper places. Tests are independent of other classes.
* Version control - passing. N/c.

## Status
Project is: _in progress_

## Contact
Created by
* [@michaelpmattson](https://github.com/michaelpmattson)

~ feel free to contact me! ~
