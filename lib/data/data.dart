import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memory_app/model/tile_model.dart';
import 'package:flutter/material.dart';

int movesCounter = 0;
bool selected = false;
List<TileModel> pairs = new List<TileModel>();
IconData selectedIcon = null;
int selectedTileIndex;
int score = 0;

List<TileModel> visiblePairs = new List<TileModel>();

List<TileModel> getPairs() {
  List<TileModel> pairs = new List<TileModel>();
  TileModel tileModel = new TileModel();

  //1
  tileModel.setColor(Color(0xFF4CB4E4));
  tileModel.setIsSelected(false);
  tileModel.setIcon(FontAwesomeIcons.dog);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //2
  tileModel.setColor(Color(0xFF4CB4E4));
  tileModel.setIsSelected(false);
  tileModel.setIcon(FontAwesomeIcons.paw);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //3
  tileModel.setColor(Color(0xFF4CB4E4));
  tileModel.setIsSelected(false);
  tileModel.setIcon(FontAwesomeIcons.mountain);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //4
  tileModel.setColor(Color(0xFF4CB4E4));
  tileModel.setIsSelected(false);
  tileModel.setIcon(FontAwesomeIcons.tree);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //5
  tileModel.setColor(Color(0xFF4CB4E4));
  tileModel.setIsSelected(false);
  tileModel.setIcon(FontAwesomeIcons.music);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //6
  tileModel.setColor(Color(0xFF4CB4E4));
  tileModel.setIsSelected(false);
  tileModel.setIcon(FontAwesomeIcons.igloo);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  return pairs;
}

List<TileModel> getQuestions() {
  List<TileModel> pairs = new List<TileModel>();
  TileModel tileModel = new TileModel();

  //1
  tileModel.setColor(Color(0xFF2E3D49));
  tileModel.setIsSelected(false);
  tileModel.setIcon(FontAwesomeIcons.question);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //2
  tileModel.setColor(Color(0xFF2E3D49));
  tileModel.setIsSelected(false);
  tileModel.setIcon(FontAwesomeIcons.question);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //3
  tileModel.setColor(Color(0xFF2E3D49));
  tileModel.setIcon(FontAwesomeIcons.question);
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //4
  tileModel.setColor(Color(0xFF2E3D49));
  tileModel.setIcon(FontAwesomeIcons.question);
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //5
  tileModel.setColor(Color(0xFF2E3D49));
  tileModel.setIcon(FontAwesomeIcons.question);
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //6
  tileModel.setColor(Color(0xFF2E3D49));
  tileModel.setIcon(FontAwesomeIcons.question);
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  return pairs;
}
