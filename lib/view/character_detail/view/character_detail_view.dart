import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/component/text/text.dart';
import '../../../product/utils/material_color.dart';
import '../../home/model/marvel_model.dart';
import '../viewmodel/character_detail_view_model.dart';

class CharacterDetailView extends StatefulWidget {
  final Results character;

  const CharacterDetailView({Key? key, required this.character})
      : super(key: key);

  @override
  State<CharacterDetailView> createState() => _CharacterDetailViewState();
}

class _CharacterDetailViewState extends State<CharacterDetailView> {
  late CharacterDetailViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = CharacterDetailViewModel();
    viewModel.getCharacterDetail(widget.character.id!);
  }

  @override
  Widget build(BuildContext context) {
    return _scaffold();
  }

  Scaffold _scaffold() {
    return Scaffold(
      backgroundColor: AppColors.marvelRed,
      appBar: AppBar(
        title: CustomText(
          fontSize: 16,
          text: '${widget.character.name}',
          textColor: AppColors.marvelWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _sized1,
          _pictureOfTheCharacterTitle(),
          _sized3,
          _characterImage(),
          _sized2,
          _descriptionTitle(),
          _sized3,
          _description(),
          _sized2,
          _comicsTitle(),
          _sized3,
          _listView(),
        ],
      ),
    );
  }

  CustomText _comicsTitle() {
    return const CustomText(
      fontSize: 16,
      text: 'Comics',
      textColor: AppColors.marvelBlack,
      fontWeight: FontWeight.w700,
    );
  }

  CustomText _description() {
    return CustomText(
      textAlign: TextAlign.center,
      fontSize: 14,
      text: '${widget.character.description}'.isEmpty
          ? 'Information Not Available'
          : '${widget.character.description}',
      textColor: AppColors.marvelWhite,
      fontWeight: FontWeight.w400,
    );
  }

  CustomText _descriptionTitle() {
    return const CustomText(
      fontSize: 16,
      text: 'Description',
      textColor: AppColors.marvelBlack,
      fontWeight: FontWeight.w700,
    );
  }

  Center _characterImage() {
    return Center(
      child: Image.network(
        '${widget.character.thumbnail!.path}.${widget.character.thumbnail!.extension}',
        fit: BoxFit.cover,
        height: kToolbarHeight * 3,
        width: kToolbarHeight * 5,
      ),
    );
  }

  CustomText _pictureOfTheCharacterTitle() {
    return const CustomText(
      fontSize: 16,
      text: 'Picture Of The Character',
      textColor: AppColors.marvelBlack,
      fontWeight: FontWeight.w700,
    );
  }

  SizedBox get _sized1 => const SizedBox(
        height: kToolbarHeight,
      );

  SizedBox get _sized2 => const SizedBox(
        height: kToolbarHeight / 2,
      );

  SizedBox get _sized3 => const SizedBox(
        height: kToolbarHeight / 3,
      );

  Observer _listView() {
    return Observer(
      builder: (_) {
        if (viewModel.char == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (viewModel.char!.isNotEmpty) {
          return _list();
        } else if (viewModel.char!.isEmpty) {
          return const Center(child: Text('Information Not Available'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  ListView _list() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: viewModel.char!.length,
      itemBuilder: (context, index) {
        final char = viewModel.char![index];
        return CustomText(
          textAlign: TextAlign.center,
          fontSize: 14,
          text: char.series!.name!,
          textColor: AppColors.marvelWhite,
          fontWeight: FontWeight.w400,
        );
      },
    );
  }
}
