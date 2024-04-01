import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let testVC = storyboard?.instantiateViewController(withIdentifier: "TestViewController") as? TestViewController else { return }
        
        present(testVC, animated: true)
    }
}

