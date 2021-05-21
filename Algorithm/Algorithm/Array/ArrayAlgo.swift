//
//  ArrayAlgo.swift
//  Algorithm
//
//  Created by Gautam Kumar Singh on 21/5/21.
//

import Foundation

class ArrayAlgo{
    
    func solutionToRotate(_ A:[Int], _ K : Int) -> [Int]{
        guard !A.isEmpty else {return []}
        guard K > 0 else {return A}
        var result = A
        for index in Array.init(repeating: 0, count: K) {
            result.insert(result.removeLast(), at: index)
        }
        return result
    }
    func solutionToDashPhoneNumber(_ S: String)->String{
        let starValue = S.replacingOccurrences(of: "--", with: "")
        let noSpace = starValue.components(separatedBy: ["-", " ","/"]).filter({!$0.isEmpty}).joined()
        var result = ""
        var count = -2
        for c in noSpace {
            result.append(c)
            if count % 3 == 0 {
                result.append("-")
            }
            count += 1
        }
        if result.last == "-" {
            result = String(result.dropLast())
        }
        
        var chars = Array(result)
        let secondLastPtr = chars.count - 2
        if chars[secondLastPtr] == "-" {
            chars[secondLastPtr] = chars[secondLastPtr - 1]
            chars[secondLastPtr - 1] = "-"
        }
        
        return String(chars)
    }

    func solutionToFormat2(_ S: String)->String{
        let starValue = S.replacingOccurrences(of: "--", with: "")
        var result = starValue.components(separatedBy: ["-", " "]).filter({!$0.isEmpty}).joined()
        var totalCount = result.count
        if totalCount > 3 {
            for index in stride(from: 0, through: result.count + 1 , by: 4){
                let value = totalCount - index
                if value < 2  {
                    break
                } else{
                    if value < 5 {
                        result.insert("-", at: result.index(result.startIndex, offsetBy: index  + 2 ))
                    }else{
                        result.insert("-", at: result.index(result.startIndex, offsetBy: index  + 3 ))
                    }
                }
                totalCount = result.count
            }
        }
        if result.last == "-" {
            result = String(result.dropLast())
        }
        return result
    }
    func solutionToSearch(_ A : [String], _ B:[String],_ P: String) -> String{
        var result = [String]()
        for (index,item) in B.enumerated() {
            if item.contains(P) {
                result.append(A[index])
            }
        }
        if result.count == 0{
            return "No Contact"
        }else if result.count == 1{
            return result.first!
        }else{
            return result.sorted().first!
        }
    }
}
