//
//  DetailViewController.swift
//  SmurfViewer
//
//  Created by Arturo Dominguez Sanchez on 28/07/2020.
//  Copyright © 2020 Bofin Ltd. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .portrait }
    override open var shouldAutorotate: Bool { return false }
    
    let detailImageView = UIImageView()
    let lblTitle = UILabel()
    let lblDescription = UILabel()
    
    var smurf = SmurfModel()
    var cacheImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        forcePortrait()
        
        view.backgroundColor = .white
        view.layoutMargins = .init(top: 10, left: 10, bottom: 10, right: 10)
        navigationItem.title = NSLocalizedString("Smurf Detail", comment: "")
        
        //Detail imageView
        
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        detailImageView.contentMode = .scaleAspectFit
        detailImageView.image = cacheImage
        view.addSubview(detailImageView)
        
        NSLayoutConstraint.activate([
            detailImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            detailImageView.heightAnchor.constraint(equalToConstant: 400)
        ])
          
        //Title Label
          
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.text = smurf.name
        lblTitle.font = .systemFont(ofSize: 30, weight: .bold)
        lblTitle.textColor = color1
        view.addSubview(lblTitle)
          
        NSLayoutConstraint.activate([
            lblTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblTitle.topAnchor.constraint(equalTo: detailImageView.layoutMarginsGuide.bottomAnchor, constant: 20),
            lblTitle.heightAnchor.constraint(equalToConstant: 30)

        ])
          
          //Description label
          
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        lblDescription.text = smurf.wikipediaInfo
        lblDescription.numberOfLines = 0
        lblDescription.lineBreakMode = .byWordWrapping
        lblDescription.baselineAdjustment = .none
        lblDescription.textAlignment = .justified
        lblDescription.adjustsFontSizeToFitWidth = true
        lblDescription.minimumScaleFactor = 0.5
        lblDescription.font = .systemFont(ofSize: 18, weight: .light)
        lblDescription.textColor = color2
        view.addSubview(lblDescription)

        NSLayoutConstraint.activate([
            lblDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lblDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lblDescription.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 20)
        ])
          

    }

    
    
}


extension UIViewController {

  func forcePortrait() {
    UIView.setAnimationsEnabled(false)
    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
    UIView.setAnimationsEnabled(true)
  }

}
