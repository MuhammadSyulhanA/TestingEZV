//
//  ApiService.swift
//  TestingPERTAMA
//
//  Created by M. Syulhan Al Ghofany on 02/03/23.
//

//import Foundation
//
//class ApiService {
//  private var dataTask: URLSessionDataTask?
//
//    func getservice(){
//        let urlString = "https://private-anon-f2977df9d6-gpimobiletakehometest.apiary-mock.com/vouchers"
//        let url = URL(string: urlString)!
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: url) { [self] data, response, error in
//          if let error = error {
//            print(error)
//            return
//          }
//          guard let data = data else {
//            print("data is nil")
//            return
//          }
//          let decoder = JSONDecoder()
//          do {
//            let radio = try decoder.decode(VoucherModel.self, from: data)
//            DispatchQueue.main.async {
//              self.tableView.reloadData()
//              self.activityIndicator.stopAnimating()
//            }
//          } catch {
//            print("Error Parsing JSON: (error)")
//          }
//        }
//        dataTask.resume()
//      }
//}
