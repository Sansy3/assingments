import XCTest
@testable import UsersTestingAssignment

class UserCellTests: XCTestCase {
    
    var userCell: UserCell!
    var mockSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        userCell = UserCell(style: .default, reuseIdentifier: "UserCell")
        mockSession = MockURLSession()
    }
    
    override func tearDown() {
        userCell = nil
        mockSession = nil
        super.tearDown()
    }
    
    func testConfigureWithUserViewModel() {
        let name = Name(title: "Mr", first: "John", last: "Doe")
        let picture = Picture(
            large: "https://example.com/large.jpg",
            medium: "https://example.com/medium.jpg",
            thumbnail: "https://example.com/thumbnail.jpg"
        )
        
        let userVM = UserViewModel(
            user: User(
                gender: "male",
                name: name,
                email: "john.doe@example.com",
                picture: picture,
                nat: "US",
                cell: "123-456-7890 / 987-654-3210",
                phone: "987-654-3210"
            )
        )
        
        userCell.configure(with: userVM)
        
        XCTAssertEqual(userCell.getUserNameLabel().text, "Mr John Doe")
        XCTAssertEqual(userCell.getContactNumberLabel().text, "123-456-7890 / 987-654-3210 / 987-654-3210")
        XCTAssertEqual(userCell.getEmailLabel().text, "john.doe@example.com")
    }
}


    
