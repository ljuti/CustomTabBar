# CustomTabBar

Custom RubyMotion implementation of tab bar navigation for iOS.

This implementation allows you to have buttons with variable widths and
heights, custom background images and implement popular "raised" buttons
that overflow the tab navigation bar.

# Usage

Clone the repository and run `bundle install` to install necessary gems.
You should be able to try the app out in RubyMotion straight away by
running `rake` on the command line.

By default, the tab nav has five buttons with the center button raised about
15 pixels above the tab navigation frame top, center button selected and its
view controller visible.

Define your tab navigation in `HALTabBarController` class. Create the buttons
with icon and geometry like this:

    origin = CGPoint.make(x: 0, y: 0)
    dimensions = CGSize.make(width: 80, height: 44)
    HALTabButton.alloc.initWithIcon("myIcon", origin, dimensions, @tabBar, viewController)

I'm using `geomotion` to define button geometry. The second parameter is the origin
of the button and the third parameter are the dimensions of the button.

You'll need to pass in the view controller the button will change to once the
button is pressed.

Button background is defined in `HALTabButton` class. It's currently using
`tab_bar_gradient.png` as its default background and `tab_bar_gradient_highlighted.png`
as the highlighted background.

# License

MIT license.

# TODO

* Notifications
* Tests