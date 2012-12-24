class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    tabBarController = HALTabBarController.alloc.initWithNibName(nil, bundle: nil)

    @window.rootViewController = tabBarController
    @window.makeKeyAndVisible
    true
  end
end
