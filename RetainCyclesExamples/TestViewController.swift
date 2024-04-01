import Foundation
import UIKit

class TestViewController: UIViewController {
    
    override func viewDidLoad() {
        print("TestViewController - Allocated ✅")
        super.viewDidLoad()
    }
    
    deinit {
        print("TestViewController - Deallocated ❌")
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
