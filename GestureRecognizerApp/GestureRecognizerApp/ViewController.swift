

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var isMFO = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
            
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        
        imageView.addGestureRecognizer(gestureRecognizer)

    }
    
    @objc func changePic(){
        
        if (isMFO % 3 == 0) {
            
            imageView.image = UIImage(named: "mazhar")
            label.text = "Mazhar"
            isMFO += 1
        }
        else if (isMFO % 3 == 1)
        {
            imageView.image = UIImage(named: "fuat")
            label.text = "Fuat"
            isMFO += 1
        }
        else
        {
            imageView.image = UIImage(named: "ozkan")
            label.text = "Özkan"
            isMFO += 1
        }

        
    }

            

}

