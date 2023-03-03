//
//  ProductViewController.swift
//  TestingPERTAMA
//
//  Created by M. Syulhan Al Ghofany on 02/03/23.
//

import UIKit

class ProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var product = [DataProduct]()
    private var detailProduct : [DataProduct]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: ProductTableViewCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: "ProductTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self

        getservice()

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 10

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 12
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        let controller = ProductDetailViewController()
        let movie = didSelectRowAt(indexPath: indexPath)
        controller.movie = DataProduct(id: movie.id, title: movie.title, description: movie.description, price: movie.price, discountPercentage: movie.discountPercentage, rating: movie.rating, stock: movie.stock, brand: movie.brand, category: movie.category, thumbnail: movie.thumbnail, images: movie.images)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        let show = product[indexPath.row]

        cell.title.text = show.title
        cell.desc.text = "Stock: \(String(show.stock))"
        cell.brand.text = "Brand: \(show.brand)"
        cell.rating.text = "Rating: \(String(show.rating))"
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapLove(tapGestureRecognizer:)))
//        tapGestureRecognizer.numberOfTapsRequired = 1
        cell.love.isUserInteractionEnabled = true
        cell.love.addGestureRecognizer(tapGestureRecognizer)
        

        let urlString = (show.thumbnail)
        let url = URL(string: urlString)!
        cell.thumbnail.downloaded(from: url)

        return cell
    }
    
    @objc func tapLove(tapGestureRecognizer: UITapGestureRecognizer) {
        print("tes keteken")
    }
    
    func didSelectRowAt(indexPath: IndexPath) -> DataProduct{
        return product[indexPath.row]
    }
    
    func getservice(){
        let urlString = "https://dummyjson.com/products"
        let url = URL(string: urlString)!
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { [self] data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {
                print("data is nil")
                return
            }
            let decoder = JSONDecoder()
            do {
                let radio = try decoder.decode(Products.self, from: data)
                print(radio)
                DispatchQueue.main.async {
                    self.product = radio.products
                    self.tableView.reloadData()
                }
          } catch {
              print(error)
              print("Error Parsing JSON: (error)")
          }
        }
        dataTask.resume()
      }

}
