import UIKit

final class TableViewCell: UITableViewCell {
    
    static let shared = "TableViewCell"
    
    private let imageContentView = UIImageView()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let priceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        appearanceUIElemts()
        behaviorUIElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func appearanceUIElemts() {
        imageContentView.contentMode = .scaleAspectFill
        
        nameLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        nameLabel.textColor = #colorLiteral(red: 0.1333333333, green: 0.1568627451, blue: 0.1921568627, alpha: 1)
        nameLabel.textAlignment = .left
        
        descriptionLabel.font = .systemFont(ofSize: 13, weight: .regular)
        descriptionLabel.textColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6784313725, alpha: 1)
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
        
        priceLabel.font = .systemFont(ofSize: 13, weight: .regular)
        priceLabel.textColor = #colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 1)
        priceLabel.layer.borderWidth = 1
        priceLabel.layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 1)
        priceLabel.layer.cornerRadius = 6
        priceLabel.textAlignment = .center
    }
    
    private func behaviorUIElements() {
        addSubview(imageContentView)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(priceLabel)
        
        imageContentView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageContentView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            imageContentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageContentView.widthAnchor.constraint(equalToConstant: 132),
            imageContentView.heightAnchor.constraint(equalToConstant: 132),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            nameLabel.leadingAnchor.constraint(equalTo: imageContentView.trailingAnchor, constant: 32),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageContentView.trailingAnchor, constant: 32),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            priceLabel.heightAnchor.constraint(equalToConstant: 32),
            priceLabel.widthAnchor.constraint(equalToConstant: 87)
        ])
    }
    
    func setupUIData(image: String, name: String, description: String, price: Int) {
        DispatchQueue.main.async {
            guard let imageURL = URL(string: image) else { return }
            let imageData = try? Data(contentsOf: imageURL)
            self.imageContentView.image = UIImage(data: imageData ?? Data())
        }
       
        nameLabel.text = name
        descriptionLabel.text = description
        priceLabel.text = "от \(price) р"
    }
    
}
