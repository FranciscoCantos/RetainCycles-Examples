import Foundation
import UIKit

class TestViewController: UIViewController {
    
    override func viewDidLoad() {
        print("TestViewController - Allocated ✅")
        super.viewDidLoad()
        
        // Uncomment the line below to test a STRONG reference
        //addTimerSTRONG()
        
        // Uncomment the line below to test a WEAK reference. Best solution in this case
        addTimerWEAK()
        
        // Uncomment the line below to test a STRONG reference. Worst solution in this case
        //addTimerUnowned()
    }
    
    deinit {
        print("TestViewController - Deallocated ❌")
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    private func printFinish() {
        print("TestViewController - Finish 😀")
    }
    
    /*
     This code contains a STRONG reference to the view controller 'self.printFinish()'. After 5 seconds prints message.
     STRONG references increment by 1 the ARC.
     If during those 5 seconds, clicks on the close button and dismissing the view, the view will be deallocated and the message printed
     
     In an example where a call is made to an API and it takes a long time to respond, this would cause a retention cycle because the ARC would never
     subtract the incremented value by 1.
     */
    private func addTimerSTRONG() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.printFinish()
        }
    }
    
    /*
     This code contains a WEAK reference to the view controller 'self.printFinish()'. After 5 seconds prints message.
     WEAK references dont increment ARC.
     If during those 5 seconds, clicks on the close button and dismissing the view, the view will be deallocated but will not print the message because
     the reference to 'self' is nil
     
     In an example where a call is made to an API and it takes a long time to respond, this wouldn't cause a retention cycle because the ARC was never
     increased.
     */
    private func addTimerWEAK() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            guard let self = self else { return }
            self.printFinish()
        }
    }
    
    /*
     This code contains a UNOWNED reference to the view controller 'self.printFinish()'. After 5 seconds prints message.
     UNOWNED references dont increment ARC, but ensure that the object will never be nil.
     If during those 5 seconds, clicks on the close button and dismissing the view, the view will be deallocated and will get a crash after 5 seconds because
     the reference to 'self' is nil
     
     In an example where a call is made to an API and it takes a long time to respond, this wouldn't cause a retention cycle because the ARC was never
     increased but will get a crash 'Fatal error: Attempted to read an unowned reference but the object was already deallocated'.
     */
    private func addTimerUnowned() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [unowned self] in
            self.printFinish()
        }
    }
}
