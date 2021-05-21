//
//  ArrayTest.swift
//  AlgorithmTests
//
//  Created by Gautam Kumar Singh on 21/5/21.
//

import XCTest
@testable import Algorithm

class ArrayTest: XCTestCase {
    var sut : ArrayAlgo!
    
    override func setUp() {
        super.setUp()
        self.sut = ArrayAlgo.init()
    }
    
    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }
    /*
     Rotate array to right N times.
     https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/
     
     For example, given

         A = [3, 8, 9, 7, 6]
         K = 3
     the function should return [9, 7, 6, 3, 8]. Three rotations were made:

         [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
         [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
         [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]

     */
    func test_cylic_rotation_by_unit_1(){
        //Given
        let givenList = [3,8,9,7,6]
        let shiftBy = 1
        let expected = [6,3,8,9,7]
        // when
        let result = self.sut.solutionToRotate(givenList, shiftBy)
        
        //then
        XCTAssertEqual(result,expected , "Rotated list is different then expected one")
    }
    func test_cylic_rotation_by_unit_3(){
        //Given
        let givenList = [3,8,9,7,6]
        let shiftBy = 3
        let expected = [9,7,6,3,8]
        // when
        let result = self.sut.solutionToRotate(givenList, shiftBy)
        
        //then
        XCTAssertEqual(result,expected , "Rotated list is different then expected one")
    }
    func test_cylic_rotation_for_empty_list(){
        //Given
        let givenList = [Int]()
        let shiftBy = 1
        let expected = [Int]()
        // when
        let result = self.sut.solutionToRotate(givenList, shiftBy)
        
        //then
        XCTAssertEqual(result,expected , "Rotated list is different then expected one")
    }
    func test_cylic_rotation_by_zero(){
        //Given
        let givenList = [3,8,9,7,6]
        let shiftBy = 0
        let expected = [3,8,9,7,6]
        // when
        let result = self.sut.solutionToRotate(givenList, shiftBy)
        
        //then
        XCTAssertEqual(result,expected , "Rotated list is different then expected one")
    }
    /*
     We are given a string S representing a phone number, which we would like to reformat. String S consists of N characters: digits, spaces, and/or dashes. It contains at least two digits.
     
     Spaces and dashes in string S can be ignored. We want to reformat the given phone number is such a way that the digits are grouped in blocks of length three, separated by single dashes. If necessary, the final block or the last two blocks can be of length two.
     
     For example:
     
     S = "00-44   48 5555 8361" should become
         "004-448-555-583-61"
     
     Assume:
     - S consists only of digits (0-9), spaces, and/or dashses (-)
     - S containts at least two digits
     
     Translate:
     
     Would like to reformat a phone number string so that:
     - every third char is a "-"
     - spaces and dashes don't matter
     - if the block ends in anything other than -xxx or -xx reformat to a block of two like xx-xx (not obvious)
     
     */
    func test_dashPhoneNumber_edge_case_1(){
        //Given
        let given = "01"
        let expected = "01"
        // when
        let result = self.sut.solutionToDashPhoneNumber(given)
        
        //then
        XCTAssertEqual(result,expected , "Resulted String is different then expected one")
    }
    func test_dashPhoneNumber_edge_case_2(){
        //Given
        let given = "012"
        let expected = "012"
        // when
        let result = self.sut.solutionToDashPhoneNumber(given)
        
        //then
        XCTAssertEqual(result,expected , "Resulted String is different then expected one")
    }
    func test_dashPhoneNumber_edge_case_3(){
        //Given
        let given = "012--3 /"
        let expected = "01-23"
        // when
        let result = self.sut.solutionToDashPhoneNumber(given)
        
        //then
        XCTAssertEqual(result,expected , "Resulted String is different then expected one")
    }
    
    func test_dashPhoneNumber_edge_case_4(){
        //Given
        let given = "012--3 /     234"
        let expected = "012-32-34"
        // when
        let result = self.sut.solutionToDashPhoneNumber(given)
        
        //then
        XCTAssertEqual(result,expected , "Resulted String is different then expected one")
    }
    
    func test_dashPhoneNumber_edge_case_5(){
        //Given
        let given = "0123456789"
        let expected = "012-345-67-89"
        // when
        let result = self.sut.solutionToDashPhoneNumber(given)
        
        //then
        XCTAssertEqual(result,expected , "Resulted String is different then expected one")
    }
    func test_dashPhoneNumber_edge_case_6(){
        //Given
        let given = "-----------0123456789  345 2"
        let expected = "012-345-678-934-52"
        // when
        let result = self.sut.solutionToDashPhoneNumber(given)
        
        //then
        XCTAssertEqual(result,expected , "Resulted String is different then expected one")
    }
    /*
     When someone searches their contacts based on a phone number, it's nice when a list
     of contact pops up.
     
     Write an algorithm that searches you contacts for phone number strings, and returns:
      - NO CONTACT if contact can't be found
      - A contact if a contact is found
      - The first alphabetized contact if there are multiple
     
     A = ["Gautam", "Singh"]             // Contacts (return one of these)
     B = ["12345678", "233344456"] // Phone numbers for each contact A[i] = B[i]
     P = "444456"                    // Search phrase
     */
    func test_search_contact_case_1(){
        //Given
        let contacts = ["Gautam", "Singh"]
        let phoneNumbers = ["12345678", "233344456"]
        let searchPhrase = "44456"
        let expected = "Singh"
        // when
        let result = self.sut.solutionToSearch(contacts, phoneNumbers, searchPhrase)
        
        //then
        XCTAssertEqual(result,expected , "Resulted String is different then expected one")
    }
    
    func test_search_contact_case_2(){
        //Given
        let contacts = [String]()
        let phoneNumbers = [String]()
        let searchPhrase = ""
        let expected = "No Contact"
        // when
        let result = self.sut.solutionToSearch(contacts, phoneNumbers, searchPhrase)
        
        //then
        XCTAssertEqual(result,expected , "Resulted String is different then expected one")
    }
}
