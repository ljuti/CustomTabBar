class HALTabBarController < HALViewController
  def viewDidLoad
    vc1 = HALViewController.alloc.initWithNibName(nil, bundle: nil)
    vc2 = HALViewController.alloc.initWithNibName(nil, bundle: nil)
    vc3 = HALViewController.alloc.initWithNibName(nil, bundle: nil)

    vc1.view.backgroundColor = UIColor.redColor
    vc2.view.backgroundColor = UIColor.greenColor
    vc3.view.backgroundColor = UIColor.blueColor

    @tabBar = HALTabBar.alloc.initWithNibName(nil, bundle: nil)
    @tabBar.viewController = self

    HALTabButton.alloc.initWithIcon("firstIcon", CGPoint.make(x: 0, y: 1), CGSize.make(width: 63, height: 44), @tabBar, vc1)
    HALTabButton.alloc.initWithIcon("secondIcon", CGPoint.make(x: 64, y: 1), CGSize.make(width: 63, height: 44), @tabBar, vc2)
    default = HALTabButton.alloc.initWithIcon("thirdIcon", CGPoint.make(x: 128, y: 1), CGSize.make(width: 65, height: 60), @tabBar, vc3)
    HALTabButton.alloc.initWithIcon("fourthIcon", CGPoint.make(x: 193, y: 1), CGSize.make(width: 63, height: 44), @tabBar, vc2)
    HALTabButton.alloc.initWithIcon("fifthIcon", CGPoint.make(x: 257, y: 1), CGSize.make(width: 63, height: 44), @tabBar, vc1)

    @tabBar.addButtonViews
    @tabBar.selectDefaultView(default)
    self.view.addSubview(@tabBar)
  end

  def switchViewController(viewController)
    viewController.view.frame = CGRect.make(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height - (@tabBar.frame.size.height))
    self.view.insertSubview(viewController.view, belowSubview:@tabBar)
  end
end