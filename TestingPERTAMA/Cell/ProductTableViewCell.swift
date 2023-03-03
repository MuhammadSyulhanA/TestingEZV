//
//  ProductTableViewCell.swift
//  TestingPERTAMA
//
//  Created by M. Syulhan Al Ghofany on 02/03/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var love: UIImageView!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var title: UILabel!
    
    static let identifier = "ProductTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thumbnail.addSubview(love)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
