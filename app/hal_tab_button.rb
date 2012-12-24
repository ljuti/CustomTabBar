class HALTabButton
  attr_accessor :icon
  attr_accessor :highlightedIcon
  attr_accessor :view
  attr_accessor :viewController
  attr_accessor :origin
  attr_accessor :dimensions
  attr_accessor :tabBar

  def initWithIcon(icon, origin, dimensions, tabBar, viewController)
    @icon             = UIImage.imageNamed(icon)
    @highlightedIcon  = UIImage.imageNamed(icon + "_highlighted")
    @origin           = origin
    @dimensions       = dimensions
    @tabBar           = tabBar
    @viewController   = viewController
    createView
    setupEvents
    @tabBar.buttons.addObject(self)
    self
  end

  def createView
    @view = UIButton.buttonWithType(UIButtonTypeCustom)
    @view.frame = [@origin, @dimensions]
    background = UIImage.imageNamed("tab_bar_gradient", stretchableImageWithLeftCapWidth:1, topCapHeight:0)
    backgroundHighlighted = UIImage.imageNamed("tab_bar_gradient_highlighted", stretchableImageWithLeftCapWidth:1, topCapHeight:0)
    @view.setImage(@icon, forState:UIControlStateNormal)
    @view.setImage(@highlightedIcon, forState:UIControlStateHighlighted)
    @view.setImage(@highlightedIcon, forState:UIControlStateSelected)
    @view.setBackgroundImage(background, forState:UIControlStateNormal)
    @view.setBackgroundImage(backgroundHighlighted, forState:UIControlStateSelected)
    if heightDifference > 0
      adjustViewHeight
    end
  end

  def heightDifference
    @dimensions.height - @tabBar.frame.size.height
  end

  def adjustViewHeight
    center = CGPoint.make(x: @tabBar.frame.center.x, y: @tabBar.frame.center.y)
    center.y = center.y - heightDifference/2.0
    @view.center = center
  end

  def deselect
    @view.selected = false
  end

  def setupEvents
    @view.when(UIControlEventTouchUpInside) do
      @tabBar.buttons.each(&:deselect)
      @view.selected = true
      @tabBar.viewController.switchViewController(@viewController)
    end
  end
end