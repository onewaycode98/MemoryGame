import 'package:flutter/material.dart';

class TileModel {
  Color color;
  bool isSelected;
  IconData icon;

  TileModel({this.color, this.isSelected, this.icon});

//setter
  void setColor(Color getColor) {
    color = getColor;
  }

  void setIsSelected(bool getIsSelected) {
    isSelected = getIsSelected;
  }

  void setIcon(IconData getIcon) {
    icon = getIcon;
  }

  //getter
  Color getColor() {
    return color;
  }

  bool getIsSelected() {
    return isSelected;
  }

  IconData getIcon() {
    return icon;
  }
}
