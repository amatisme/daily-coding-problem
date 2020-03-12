//
//  29-dailycodingproblem.swift
//
//  Write an algorithm to justify text. Given a sequence of words
//  and an integer line length k, return a list of strings which
//  represents each line, fully justified.
//
//  Created by Amatisme on 2020-03-10.
//

import Foundation

func appendedWordsCount(currentWords: [String], appendedWord: String) -> Int {
//    Using .joined does not add a space to first word in array
    var arr = currentWords
    arr.append(appendedWord)
    return arr.joined(separator: " ").count
}

func groupLines(words: [String], length: Int) -> [[String]] {
//    Returns groupings of |words| whose total length, including 1 space in between,
//    is less than |length|.

    var groups: [[String]] = []
    var currentLine: [String] = []
    
    for word in words {
//        Precondition: every |word| must be longer |length|.
        guard word.count <= length else {
            print ("Error. The longest word '\(word)' must be longer than \(length).")
            return []
        }
//        check if adding another word breaks the limit
        if appendedWordsCount(currentWords: currentLine, appendedWord: word) > length {
            groups.append(currentLine)
            currentLine.removeAll()
        }
        currentLine.append(word)
    }
    groups.append(currentLine)
    return groups
}

func justify(words: [String], length: Int) -> String {
//    Precondition: |words| can fit in |length|.
    guard words.count != 1 else {
        let prefix = String(repeating: " ", count: length - words[0].count)
        return words[0] + prefix
    }
    
    let spacesToDistribute = length - words.reduce(0, {
        result, item in result + item.count
    })
    let numberOfSpaces = words.count - 1
    let spaceLength = spacesToDistribute / numberOfSpaces
    let remainingSpaceLength = spacesToDistribute - (numberOfSpaces * spaceLength)
    
    var justifiedWords: [String] = []
    var spaceCount = spacesToDistribute

    for word in words {
//        Get available space. If at zero, reset. Then truncate by length of space
        spaceCount = (spaceCount == 0 ? spacesToDistribute: spaceCount) - spaceLength
        
//        Check if spaces are distributed evenly
        if remainingSpaceLength == 0 {
            let prefix = String(repeating: " ", count: spaceLength)
            justifiedWords.append(prefix + word)
        } else {
//            Determine how much padding is needed.
            let padding = remainingSpaceLength == spaceLength ? remainingSpaceLength - 1 : 1
            
//            check if the space remaining is greater than the length of the spacing. If so, pad
            spaceCount = spaceCount < spaceLength ? spaceLength: spaceLength + padding
            let prefix = String(repeating: " ", count: spaceCount)
            justifiedWords.append(prefix + word)
        }
    }
//    Iterate over array and join all items, then trim intial space
    return justifiedWords.joined().trimmingCharacters(in: .whitespacesAndNewlines)
}

func justifyText(words: [String], length: Int) -> () {
    for group in groupLines(words: words, length:length) {
        print(justify(words: group, length:length))
    }
}


let line = """
    Soufflé candy canes toffee biscuit. Powder sweet roll tiramisu fruitcake gummies powder toffee liquorice muffin. Bear claw jujubes jelly gummies. Danish pudding tootsie roll sweet roll cupcake dessert. Chocolate chocolate bar oat cake bear claw carrot cake cotton candy chocolate biscuit. Fruitcake icing soufflé halvah. Halvah toffee candy gingerbread apple pie. Liquorice brownie gummi bears chocolate carrot cake chocolate cake tootsie roll marzipan fruitcake. Liquorice caramels apple pie chupa chups muffin jelly beans marshmallow. Pastry caramels halvah dessert cake carrot cake chocolate bar soufflé oat cake. Jelly cotton candy chocolate danish pudding. Sesame snaps tiramisu brownie carrot cake powder powder tiramisu gummi bears. Caramels muffin pudding liquorice. Carrot cake topping cheesecake cupcake brownie biscuit oat cake lollipop pastry.
"""
let words = line.components(separatedBy: " ")
let length = 55
justifyText(words: words, length: length)
