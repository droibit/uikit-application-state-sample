import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private var actionsDelaiedUntilActive: [() -> Void] = []

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("\(type(of: self))#\(#function)")
        
        actionsDelaiedUntilActive.forEach { action in
            action()
        }
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("\(type(of: self))#\(#function)")
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print("open url: \(url), state=\(String(describing: app.applicationState))")
        
        if app.applicationState == .inactive {
            actionsDelaiedUntilActive.append {
                print("delaied action untile active(\(String(describing: UIApplication.shared.applicationState)))")
            }
        } else {
            print("No delay action ...")
        }
        
        return true
    }
}

