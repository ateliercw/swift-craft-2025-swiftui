# Animations - Hands on

This app has a handful of views with features to implement based on what we learned in this section:

## Animations

- Update `ExplicitAnimationView` to change the fill color and position of the circle when the view is toggled, animate this change with an explicit animation.

- Update `ImplicitAnimationView` to change the rounded rectangle from a circle into a square, change the fill color, and have the view rotate 90 degrees during the animation. Use an implicit animation to animate these changes. As a stretch, 2 seconds after the toggled value is changed, set it back to "false" if it's true.

- Update `MatchMoveAnimationView` to use `matchedGeometryEffect` to have the views swap between the two.

- Update `TransitionsView` adding transitions when the views are removed or added.

## Scroll Transitions

- Use `scrollTransition` to make the `ScrollHeaderView` fade out, blur, and slide off the left right hand side of the view interactively as it scrolls into the top safe area. There is a box with a red outline added as an additional safe area inset to make ie easier to see the transition.

## Parallax Scrolling

- Use an `onGeometryChange` to track the progress of the view within the scroll view, and then use that to add a parallax scrolling effect where the image moves at a slower or faster rate than the scrolling rate of the scroll view.
