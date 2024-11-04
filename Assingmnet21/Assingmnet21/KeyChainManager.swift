import Foundation

class KeychainManager {
    
    enum KeyChainError: Error {
        case sameItemFound
        case unknown
        case nosuchDataFound
        case KCErrorWithCode(Int)
    }
    
    func viewDidLoad() {
        save()
        get()
    }
    
    func save() {
        do {
            try save(
                service: "some service",
                account: "ios",
                password: "paroli".data(using: .utf8) ?? Data()
            )
        } catch {
            print(error)
        }
    }
    
    func get() {
        guard let data = get(service: "countryAPI", account: "saxeli@sasas") else {
            print("failed load password")
            return
        }
        
        let password = String(decoding: data, as: UTF8.self)
        print(password, "🟢")
    }
    
    func save(
        service: String,
        account: String,
        password: Data
    ) throws {
        let query: [String: AnyObject] = [
            kSecClass as String         : kSecClassGenericPassword,
            kSecAttrService as String   : service as AnyObject,
            kSecAttrAccount as String   : account as AnyObject,
            kSecValueData as String     : password as AnyObject,
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status != errSecDuplicateItem else {
            throw KeyChainError.sameItemFound
        }
        ///......
        guard status == errSecSuccess else {
            throw KeyChainError.unknown
        }
        
        print("saved")
    }
    
    func get(
        service: String,
        account: String
    ) -> Data? {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecReturnData as String: kCFBooleanTrue as AnyObject,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        print("read status \(status)")
        return result as? Data
    }
    
//    func update(password: Data, service: String, account: String) throws {
//        let query: [String: AnyObject] = [
//            kSecClass as String: kSecClassGenericPassword,
//            kSecAttrService as String: service as AnyObject,
//            kSecAttrAccount as String: account as AnyObject,
//        ]
//        
//        let attributes: [String: AnyObject] = [
//            kSecValueData as String: password as AnyObject
//        ]
//        
//        let status = SecItemUpdate(
//            query as CFDictionary,
//            attributes as CFDictionary
//        )
//        
//        guard status != errSecItemNotFound else {
//            throw KeyChainError.nosuchDataFound
//        }
//        
//        guard status == errSecSuccess else {
//            throw KeyChainError.KCErrorWithCode(Int(status))
//        }
//        
//    }
//    
//    func deletePassword(service: String, account: String) throws {
//        let query: [String: AnyObject] = [
//            kSecAttrService as String: service as AnyObject,
//            kSecAttrAccount as String: account as AnyObject,
//            kSecClass as String: kSecClassGenericPassword
//        ]
//        
//        let status = SecItemDelete(query as CFDictionary)
//        
//        guard status == errSecSuccess else {
//            throw KeyChainError.KCErrorWithCode(Int(status))
//        }
//    }
    
}
