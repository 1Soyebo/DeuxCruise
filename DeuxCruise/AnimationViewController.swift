//
//  AnimationViewController.swift
//  DeuxCruise
//
//  Created by Ibukunoluwa Soyebo on 25/12/2020.
//

import UIKit

class AnimationViewController: UIViewController {
    
    
    @IBOutlet weak var lblMoving: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.hidesBackButton = true

        self.title = "Animations"
        
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.lblMoving.frame.origin = .zero
        }, completion: nil)
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
}
