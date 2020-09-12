//
//  DetailViewController.swift
//  Image-Search-Engine
//
//  Created by Mac on 12/09/2563 BE.
//  Copyright © 2563 DND. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var productImage = UIImage()
    

    @IBOutlet weak var productImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.productImageView.image = self.productImage
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
