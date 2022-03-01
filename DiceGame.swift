//
// DiceGame.swift
//
// Created by Ina Tolo
// Created on 2022-2-28
// Version 1.0
// Copyright (c) 2022 Ina Tolo. All rights reserved.
//
// The DiceGame program implements an application that
// generates a random number, asks the user to guess,
// and keeps track of the number of guesses.

import Foundation

// stores exception at runtime
enum MyError: Error {
    case runtimeError(String)
}

// function that throws exception
func catchString() throws {
    throw MyError.runtimeError("This is not an integer!")
}

// declaring constants
let minNum = 1
let maxNum = 6

// declaring variables
// https://www.hackingwithswift.com/articles/102/how-to-generate-random-numbers-in-swift
var ranNum = Int.random(in: minNum..<maxNum + minNum)
var userGuessInt = 0
var tries = 0

// displays opening message
print("Today you will try and guess the random number!")
// blank line
print()

while userGuessInt != ranNum {
    // gets input from user
    print("Guess a number between 1 and 6: ", terminator: "")
    let userGuessString = readLine()

    do {
        // converts string input to an integer
        let userGuessInt = Int(userGuessString!) ?? 0

        if userGuessInt != Int(userGuessString!) {
            try catchString()
        }

        // checks if guess is in valid range
        if userGuessInt >= minNum && userGuessInt <= maxNum {
            // increments tries
            tries += 1
            // checks if guess is too low
            if userGuessInt < ranNum {
                // displays message that tells user they are wrong
                print("You guessed too low.")
                // blank line
                print()
            // checks if guess is too high
            } else if userGuessInt > ranNum {
                // displays message that tells user they are wrong
                print("You guessed too high.")
                // blank line
                print()
            // checks if guess is correct
            } else {
                // displays message to tell user they are correct
                print("You are correct!")
                print("It took you \(tries) tries")
            }
        } else {
            // displays error message
            print("This isn't between 1 and 6. This won't count.")
            // blank line
            print()
        }
    } catch MyError.runtimeError(let errorMessage) {
        // catches invalid strings
        print(errorMessage)
        // blank line
        print()
    }
}
