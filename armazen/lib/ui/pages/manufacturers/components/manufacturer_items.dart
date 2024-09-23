import '../manufacturer.dart';
import 'components.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ManufacturerItems extends StatelessWidget {
  final List<ManufacturerViewModel> viewModels;

  ManufacturerItems(this.viewModels);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          aspectRatio: 1
        ),
        items: viewModels.map((viewModel) => ManufacturerItem(viewModel)).toList(),
      ),
    );
  }
}