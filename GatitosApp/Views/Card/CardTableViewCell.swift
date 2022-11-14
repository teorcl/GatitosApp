//
//  CardTableViewCell.swift
//  GatitosApp
//
//  Created by TEO on 12/11/22.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var catImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpImage()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setUpImage(){
        self.catImageView.clipsToBounds = true
        self.catImageView.layer.cornerRadius = 17
    }
    
    func setUpCard(cat:Cat){
        breedLabel.text = "Raza: \(cat.name)"
        intelligenceLabel.text = "Inteligencia: \(cat.intelligence)"
        originLabel.text = "Origen: \(cat.origin)"
        
        if let urlString = cat.image?.url as? String {
            if let imageURL = URL(string: urlString){
                DispatchQueue.global().async {
                    guard let imageData = try? Data(contentsOf: imageURL) else{return}
                    let image = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        self.catImageView.image = image
                    }
                    
                }
            }
        }
    }
}
