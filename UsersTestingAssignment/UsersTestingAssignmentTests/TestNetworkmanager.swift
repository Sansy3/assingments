import XCTest
@testable import UsersTestingAssignment

class MockURLSession: URLSessionProtocol {
    var data: Data?
    var response: URLResponse?
    var error: Error?

    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task = MockURLSessionDataTask {
            completionHandler(self.data, self.response, self.error)
        }
        return task
    }
    class MockURLSessionDataTask: URLSessionDataTask {
        private let closure: () -> Void

        init(closure: @escaping () -> Void) {
            self.closure = closure
        }

        override func resume() {
            closure()
        }
    }

}


final class NetworkManagerTests: XCTestCase {
    var networkManager: NetworkManager!
    var mockSession: MockURLSession!

    override func setUp() {
        super.setUp()
        mockSession = MockURLSession()
        networkManager = NetworkManager(session: mockSession)
    }

    override func tearDown() {
        networkManager = nil
        mockSession = nil
        super.tearDown()
    }

    func testFetchUsers_Success() {
        mockSession.data = User.jsonMock.data(using: .utf8)
        mockSession.response = HTTPURLResponse(
            url: URL(string: "https://randomuser.me/api/")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        let expectation = self.expectation(description: "Fetch users expectation")
        networkManager.fetchUsers(withLimit: 1) { users in
            XCTAssertEqual(users.count, 1)
            XCTAssertEqual(users.first?.name.first, "Christian")
            XCTAssertEqual(users.first?.email, "christian.nielsen@example.com")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)

    }

    func testFetchUsers_Failure() {
        mockSession.error = NSError(domain: "TestError", code: -1, userInfo: nil)
        let expectation = self.expectation(description: "Fetch users failure expectation")
        networkManager.fetchUsers(withLimit: 1) { users in
            XCTAssertTrue(users.isEmpty)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }
}
