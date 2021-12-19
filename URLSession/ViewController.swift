//
//  ViewController.swift
//  URLSession
//
//  Created by reina.tanaka on 2021/06/16.
//

import UIKit

class ViewController: UIViewController {

    private var address: AddressModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        getAddresUrlSession(zipCode: "2790031")
    }
    
    private func getAddresUrlSession(zipCode: String) {
        let baseUrlString = "http://zipcloud.ibsnet.co.jp/api/"
        let searchUrlString = "\(baseUrlString)search"
        let searchUrl = URL(string: searchUrlString)!
        
        guard var components = URLComponents(url: searchUrl, resolvingAgainstBaseURL: searchUrl.baseURL != nil) else {
            return
        }
        components.queryItems = [URLQueryItem(name: "zipcode", value: zipCode)] + (components.queryItems ?? [])
        var request = URLRequest(url: components.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            guard let data = data else {
                return
            }
            do {
                self.address = try JSONDecoder().decode(AddressModel.self, from: data)
            } catch let error {
                print("Error: \(error)")
            }
        }.resume()
    }
    
    


}

