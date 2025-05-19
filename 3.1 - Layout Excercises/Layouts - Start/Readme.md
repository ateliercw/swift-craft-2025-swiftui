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

## ViewThatFitsLines

- Update the view so that it automatically clips the text to the limited line count if required
- Add a button that can show or hide the text

## ViewThatFitsTags

- Update the view so that it will display as many tags as you can fit on a single line;
- Display, one the same line, at the end of the tags, how many tags but did not fit; (e.g. "+ 1 more")
