///Runs the animation while chaning the state of [AdvancedIcon].
enum AdvancedIconEffect {
  ///Changes the icons by spinning them.
  spin,

  ///Changes the icons by scaling them.
  bubble,

  ///Changes the icons by fading them.
  fade,

  ///Changes the icons by flipping them horizontally.
  flipH,

  ///Changes the icons by flipping them vertically.
  flipV,

  ///Changes the icon by spinning and scaling them.
  spinBubble,

  ///Changes the icon by scaling and fading them.
  bubbleFade,

  ///Changes the icon without any effect.
  none
}

///Stores the current state of [AdvancedIcon].
enum AdvancedIconState {
  ///Primary state.
  primary,

  ///Secondary state.
  secondary,
}
