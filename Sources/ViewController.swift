import Combine
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        subscribeNotifications()
        
//        _ = NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
//            .sink { notification in
//                print("didBecomeActiveNotification(notification=\(notification)")
//            }
            
    }
    
    private func subscribeNotifications() {
        let notificationCenter = NotificationCenter.default
        [
            UIApplication.didBecomeActiveNotification: #selector(didBecomeActiveNotification(_:)),
            UIApplication.willEnterForegroundNotification: #selector(willEnterForegroundNotification(_:))
        ].forEach { (name, selector) in
            notificationCenter.addObserver(self, selector: selector, name: name, object: nil)
        }
    }
    
    @objc private func didBecomeActiveNotification(_ notification: Notification) {
        print("\(type(of: self))#\(#function)")
    }
    
    @objc private func willEnterForegroundNotification(_ notification: Notification) {
        print("\(type(of: self))#\(#function)")
    }
    
    // MARK: - IBAction
    
    @IBAction private func didTapSubscribeButton(_ sender: Any) {
//        subscribeNotification()
    }
}

