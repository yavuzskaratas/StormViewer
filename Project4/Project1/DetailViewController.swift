//
//  DetailViewController.swift
//  Project1
//
//  Created by Yavuz Selim Karataş on 24.01.2022.
//

import UIKit

class DetailViewController: UIViewController{
    @IBOutlet var imageView: UIImageView!
    var selectedImage : String?
    var selectedPictureNumber = 0
    var totalPictures = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(selectedPictureNumber) out of \(totalPictures)"
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8)
        else {
            print("no image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image,URL(string:"https://www.linkedin.com/in/yavuzskaratas")!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
        func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
            if activityType == .mail {
                return "Download #MyAwesomeApp via @twostraws."
            } else {
                return "Download MyAwesomeApp from TwoStraws."
            }
        }
    }
    
}
