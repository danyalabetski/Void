import UIKit

final class CollectionViewCellClassification: UICollectionViewCell {
    
    static let shared = "CollectionViewCellClassification"
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        contentView.addSubview(label)
        
        label.frame = contentView.bounds
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 1)
        
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 15
        contentView.layer.backgroundColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.2).cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
