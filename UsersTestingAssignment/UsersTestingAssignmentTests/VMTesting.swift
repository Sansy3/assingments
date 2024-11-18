import XCTest
@testable import UsersTestingAssignment

class UserTests: XCTestCase {
    
    var user: User!
    
    override func setUp() {
        super.setUp()
        let name = Name(title: "Mr", first: "John", last: "Doe")
        
        let picture = Picture(
            large: "https://example.com/large.jpg",
            medium: "https://example.com/medium.jpg",
            thumbnail: "https://example.com/thumbnail.jpg"
        )
        
        user = User(
                    gender: "male",
                    name: name,
                    email: "john.doe@example.com",
                    picture: picture,
                    nat: "US",
                    cell: "123-456-7890",
                    phone: "987-654-3210"
                )
    }
    
    override func tearDown() {
        user = nil
        super.tearDown()
    }
    
    func testFullname () {
        let expectedFullname = "Mr John Doe"
        let actualFullName = [user.name.title, user.name.first, user.name.last].joined(separator: " ").trimmingCharacters(in: .whitespacesAndNewlines)
        XCTAssertEqual(actualFullName, expectedFullname, "Must be concatenated ")
    }
    
    func testContactNumber() {
        let expectedNumber = "123-456-7890 / 987-654-3210"
        let actualNumber = [user.cell, user.phone].joined(separator: " / ")
        XCTAssertEqual(expectedNumber, actualNumber, "Should be combined correctly")
    }
    
    func testThumbnailImage() {
        let expecctedThumbnailURl = "https://example.com/thumbnail.jpg"
        XCTAssertEqual(user.picture.thumbnail, expecctedThumbnailURl, "Thumbnail image URL should be correct")
    }
    
    func testEmail() {
            let expectedEmail = "john.doe@example.com"
            XCTAssertEqual(user.email, expectedEmail, "Email should match the expected email address")
        }

    
}

