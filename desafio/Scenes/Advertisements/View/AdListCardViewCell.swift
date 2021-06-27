//
//  AdListCardViewCell.swift
//  desafio
//
//  Created by Fernando Luiz Goulart on 15/04/21.
//

import UIKit
import OUIKit
import Reusable

class AdListCardViewCell: UICollectionViewCell, NibLoadable, Reusable {
    
    static var nibName = "AdListCardViewCell"
    static var reuseIdentifier = "AdListCardViewCellIdentifier"

    //MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var timeLocationLabel: UILabel!
    @IBOutlet weak var adImageView: UIImageView!
    @IBOutlet weak var adImageContainer: UIView!
    @IBOutlet weak var featuredBadge: UIView!
    @IBOutlet weak var featuredLine: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBorder()
    }
    
    //MARK: - Public
    @discardableResult
    func configure(ad: Ad?) -> AdListCardViewCell {
        featuredBadge.backgroundColor = UIColor(rgb: 0x6E0AD6)
        featuredLine.backgroundColor = UIColor(rgb: 0x6E0AD6)
        featuredBadge.isHidden = true
        featuredLine.isHidden = true
        
        guard let ad = ad else { return self }
        
        self.titleLabel.text = ad.ad.subject
        self.priceLabel.text = ad.ad.prices?[0].label ?? ""
        
        let location = self.getLocation(ad.ad.locations[0])

        let date = Date(timeIntervalSinceReferenceDate: TimeInterval(ad.ad.list_time.value))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt-BR")
        dateFormatter.dateFormat = "dd/MM 'às' HH:mm"
        timeLocationLabel.text = "\(location) - \(dateFormatter.string(from: date))"
        guard let thumb = ad.ad.thumbnail else { return self }
        let imageUrl = "\(String(describing: thumb.base_url))/images/\(String(describing: thumb.path))"
        self.adImageView.downloaded(from: imageUrl)
        return self
    }
    
    private func setupBorder() {
        self.addRoundedCorners(withColor: UIColor.white, width: 0.0, radius: 5.0)
    }
    
    private func getLocation(_ location: AdLocation) -> String {
        if location.key == "neighbourhood" {
            return location.label ?? ""
        }
        guard let nextLocation = location.locations?[0] else {
            return ""
        }
        return getLocation(nextLocation)
    }
}
