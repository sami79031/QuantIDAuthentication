import XCTest
@testable import Authentication

final class LoginAuthenticationTests: XCTestCase {
    
    func testEmailLoginInit() {
        let sut = EmailLogin()
        XCTAssertNotNil(sut)
    }
    
    func testEmailLoginEmailValidation_ShouldCheckForEmpty() {
        let validator = LoginValidationImpl()
        let sut = EmailLogin(validator: validator)
        
        XCTAssertFalse(sut.login(email: "", password: ""))
    }
    
    func testEmailLoginEmailValidation_CheckEmailValid_False() {
        let validator = LoginValidationImpl()
        let sut = EmailLogin(validator: validator)
        
        XCTAssertFalse(sut.login(email: "s.m", password: ""))
    }
    
    func testEmailLoginEmailValidation_CheckEmailValid_True() {
        let validator = LoginValidationImpl()
        let sut = EmailLogin(validator: validator)
        
        XCTAssertTrue(sut.login(email: "s@.m", password: ""))
    }
    
    func testEmailLoginService_PerformLogin_NotSuccessful() async {
        let spy = HTTPClientSpy(resultHandler: .failure(NSError(domain: "", code: 1)))
        let sut: LoginService = LoginServiceImpl(client: spy)
        let result = await sut.performLogin(email: "s@m", password: "parola")
        
        switch result {
            
        case .success(_):
            XCTFail("Should not reach here")
        case .failure(let error):
            XCTAssertNotNil(error)
        }
    }
    
    func testEmailLoginService_PerformLogin_Successful() async {
        let spy = HTTPClientSpy(resultHandler: .success("aa".data(using: .utf8)!))
        let sut: LoginService = LoginServiceImpl(client: spy)
        let result = await sut.performLogin(email: "s@m", password: "parola")
        
        switch result {
            
        case .success(let data):
            XCTAssertNotNil(data)
        case .failure(_):
            XCTFail("Should not reach here")
        }
    }
    
    // MARK: Helpers
    
    class HTTPClientSpy: HTTPCllient {
        private let resultHandler: Result<Data, Error>
        
        init(resultHandler: Result<Data, Error>) {
            self.resultHandler = resultHandler
        }
        
        func perform(request: URLRequest) async -> Result<Data, Error> {
            return resultHandler
        }
        
    }
}

