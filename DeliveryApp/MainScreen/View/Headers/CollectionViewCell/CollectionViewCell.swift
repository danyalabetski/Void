import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    static let shared = "CollectionViewCell"
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        contentView.addSubview(imageView)
        
        imageView.frame = contentView.bounds
        
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
