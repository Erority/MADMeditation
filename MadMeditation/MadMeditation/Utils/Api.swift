import Foundation
import SwiftUI

class Api: ObservableObject{
    func getMiniCards(completion: @escaping (GetMiniCardModel) -> ()){
        guard let url = URL(string: "http://mskko2021.mad.hakta.pro/api/feelings") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let data = try! JSONDecoder().decode(GetMiniCardModel.self, from: data!)
            DispatchQueue.main.async {
                completion(data)
            }
        }.resume()
    }
    
    func getBigCards(completion: @escaping (GetBigCardModel) -> ()){
        guard let url = URL(string: "http://mskko2021.mad.hakta.pro/api/quotes") else {
            return
        }
        
        URLSession.shared.dataTask(with: url){ data, _, _ in
            let data = try! JSONDecoder().decode(GetBigCardModel.self, from: data!)
            DispatchQueue.main.async {
                completion(data)
            }
        }.resume()
    }

    func sendPostRequestUserData(model: PostUserDataModel, completion: @escaping (UserData) -> ()) {
        let parameters = "{\n\"email\": \"" + model.email + "\", \"password\":\"" + model.password + "\"\n}"
        let postData = parameters.data(using: .utf8)
        var _: UserData?
        
        let url = URL(string: "http://mskko2021.mad.hakta.pro/api/user/login")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            let data = try! JSONDecoder().decode(UserData.self, from: data!)
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
    
    func isCompletedLogin(model: PostUserDataModel) -> Bool {
        var finishValue = true
        var semaphore = DispatchSemaphore (value: 0)
        
        let parameters = "{\n\"email\": \"" + model.email + "\", \"password\":\"" + model.password + "\"\n}"
        let postData = parameters.data(using: .utf8)
        var _: UserData?
        
        let url = URL(string: "http://mskko2021.mad.hakta.pro/api/user/login")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            guard let data = data,
                    let response = response as? HTTPURLResponse,
                    error == nil else {
                        
                        print("error", error ?? "Unknown error")
                        finishValue = false
                        semaphore.signal()
                    return
                }

            print(response.statusCode)
            guard (200 ... 299) ~= response.statusCode else {
                    finishValue = false
                    return
                }
            
            
        }.resume()
        semaphore.wait()
        
        return finishValue
    }
}


