//
//  ProductDetailViewController.swift
//  TestingPERTAMA
//
//  Created by M. Syulhan Al Ghofany on 02/03/23.
//

import UIKit

class ProductDetailViewController: UIViewController {

    
    @IBOutlet weak var note2: UILabel!
    @IBOutlet weak var note1: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var titleData: UILabel!
    
    var movie: DataProduct!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        desc.numberOfLines = 0
        
//        let urlString = (movie.thumbnail)
//        let url = URL(string: urlString)!
//        thumbImage.image = downloaded(from: url)
        titleData.text = movie.title
        desc.text = movie.description
        note1.text = "Brand: \(movie.brand) | Category: \(movie.category) | Rating: \(movie.rating)"
        note2.text = "Price: \(movie.price) | Stock: \(movie.stock) | Disc. Percent.: \(movie.discountPercentage)"
        guard let posterImageURL = URL(string: movie.thumbnail) else {
            self.thumbImage.image = UIImage(named: "noImageAvailable")
            return
        }

        self.thumbImage.image = nil
        getImageDataFrom(url: posterImageURL)

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Get image data
      private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
          // Handle Error
          if let error = error {
            print("DataTask error: (error.localizedDescription)")
            return
          }

          guard let data = data else {
            // Handle Empty Data
            print("Empty Data")
            return
          }

          DispatchQueue.main.async {
            if let image = UIImage(data: data) {
              self.thumbImage.image = image
            }
          }
        }.resume()
      }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
