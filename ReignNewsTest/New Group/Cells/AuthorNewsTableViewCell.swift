//
//  AuthorNewsTableViewCell.swift
//  ReignNewsTest
//
//  Created by Jose David Bustos H on 10-03-23.
//

import UIKit
struct AuthorNewsViewCellModel {
    let name: String
    let title: String
    init(name: String, title: String) {
        self.name = name
        self.title = title
    }
}


class AuthorNewsTableViewCell: UITableViewCell {

    lazy var lblName: UILabel = {
        let label: UILabel = .init()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var lbltitle: UILabel = {
        let label: UILabel = .init()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imgIcon: UIImageView = {
        let image: UIImageView = .init()
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 15.0
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configLabels()
        setupUIUX()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configLabels() {
        
        lblName.font = UIFont.boldSystemFont(ofSize: 20.0)
        lblName.textColor = UIColor.black
        lblName.numberOfLines = 0
        
        lbltitle.font = UIFont.systemFont(ofSize: 15.0)
        lbltitle.textColor = UIColor.gray
        lbltitle.numberOfLines = 0
        
     
    }
    func setupUIUX() {
        self.backgroundColor = .white
        addSubview(lblName)
        addSubview(lbltitle)
        addSubview(imgIcon)
        
        imgIcon.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        imgIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        imgIcon.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imgIcon.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        lblName.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        lblName.leadingAnchor.constraint(equalTo: imgIcon.trailingAnchor, constant: 10).isActive = true
        lblName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        lblName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        lbltitle.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 10).isActive = true
        lbltitle.leadingAnchor.constraint(equalTo: imgIcon.trailingAnchor, constant: 10).isActive = true
        lbltitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        lbltitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

