//
//  DetailViewController.swift
//  HWS-Classic-Project01-StormViewer
//
//  Created by Glenn Drescher on 22/05/2020.
//  Copyright © 2020 Glenn Drescher. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var ImageView: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            ImageView.image = UIImage(named: imageToLoad)
        }
    }
    
    @objc func shareTapped() {
        guard let image = ImageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No Image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
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
