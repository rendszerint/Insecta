import controlP5.*;
ControlP5 cp5;

void gui() {
  fill(#171717);
  cp5 = new ControlP5(this);

  String[] buttons = {"clear", "save"};
  for (int i = 0; i < buttons.length; i++) {
    cp5.addButton(buttons[i])
      .setPosition(0, i * 25)
      .setSize((int) (tileSize / 2), 20)
      .setColorBackground(color(#000000))
      .setColorActive(color(#e03708))
      .setColorForeground(color(#e03708))
      .setColorCaptionLabel(color(#FFFFFF));
  }
}
