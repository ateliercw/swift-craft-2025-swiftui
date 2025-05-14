# Layouts - Hands on

This app has a handful of views with features to implement based on what we learned in this section:

## LayoutsView

- Implement the cases to add Horizontal and Grid layouts to the `TestLayout` type. The subviews already are wrapped in grid rows when you implement the grid.

## BoxesView

- Update `InsetGroupBoxStyle` with the `label` outside of the box and a custom background behind the content.
- Create a group box style that takes a color argument and applies it to the view in some way.

## AlignmentGuidesView

- Adjust the corner badge view so that the badge is outside of top right corner of the view, without affecting how the view is laid out.
- Use the provided arbitrary alignment guide to change how the circles lay out

## ViewThatFitsView

- Update the view so that it automatically clips the text to the limited line count if required
- Add a button that can show or hide the text

## ScrollingView

- Use `onGeometryChange` to make the `ScrollTrackingView` update it's content in response to how much the user has scrolled
- Add a `.scrollTransition` modifier to the `ScrollTrackingView` that fades it out as it scrolls off the top of the screen.
