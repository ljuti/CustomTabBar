class HALTabBar < UIView
  attr_accessor :buttons
  attr_accessor :viewController

  def initWithNibName(name, bundle: bundle)
    initWithFrame(CGRectZero)
    self.frame = CGRect.make(origin: tabBarOrigin, size: tabBarSize)
    self.backgroundColor = UIColor.lightGrayColor
    self.buttons = []
    self
  end

  def addButtonViews
    @buttons.each do |button|
      self.addSubview(button.view)
    end
  end

  def selectDefaultView(button)
    button.view.selected = true
    @viewController.switchViewController(button.viewController)
  end

  def tabBarOrigin
    @tabBarOrigin ||= CGPoint.make(x: 0, y: 415)
  end

  def tabBarSize
    @tabBarSize ||= CGSize.make(width: 320, height: 45)
  end
end