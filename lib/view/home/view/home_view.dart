import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:line_icons/line_icons.dart';

import '../../../core/component/bottom_loader/bottom_loader.dart';
import '../../../core/component/icon/icon.dart';
import '../../../core/component/text/text.dart';
import '../../../core/constant/enum/data_enum.dart';
import '../../../product/utils/material_color.dart';
import '../../character_detail/view/character_detail_view.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    _initViewModel();
  }

  Future<void> _initViewModel() async {
    viewModel = HomeViewModel();
    await viewModel.getCharacter();
    viewModel.scrollController.addListener(viewModel.onScroll);
  }

  @override
  void dispose() {
    viewModel.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _scaffold();
  }

  Scaffold _scaffold() {
    return Scaffold(
      backgroundColor: AppColors.marvelRed,
      appBar: _appbar(),
      body: _body(),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: const CustomText(
        textAlign: TextAlign.center,
        fontSize: 16,
        text: 'Character',
        textColor: AppColors.marvelWhite,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _body() {
    return Center(
      child: Observer(
        builder: (context) {
          switch (viewModel.status) {
            // case Data.LOADING:
            //   return const CircularProgressIndicator();
            case Data.LOADED:
              return _list();
            case Data.ERROR:
              return const Text('ERROR');
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Observer _list() {
    return Observer(
      builder: (_) {
        return _listViewBuilder();
      },
    );
  }

  ListView _listViewBuilder() {
    return ListView.builder(
      controller: viewModel.scrollController,
      itemCount: viewModel.hasReachedMax
          ? viewModel.results.length
          : viewModel.results.length + 1,
      itemBuilder: (context, index) {
        return index >= viewModel.results.length
            ? const BottomLoader()
            : _characterCard(context, index);
      },
    );
  }

  SizedBox _characterCard(BuildContext context, int index) {
    return SizedBox(
      height: kToolbarHeight * 2.3,
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: kToolbarHeight * 0.3,
          vertical: kToolbarHeight * 0.4,
        ),
        color: AppColors.marvelBlack,
        child: _listTile(context, index),
      ),
    );
  }

  Center _listTile(BuildContext context, int index) {
    return Center(
      child: ListTile(
        focusColor: AppColors.marvelBlack,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CharacterDetailView(
                character: viewModel.results[index],
              );
            },
          ),
        ),
        leading: _characterImage(index),
        title: _characterName(index),
        trailing: _arrowIcon(),
      ),
    );
  }

  Image _characterImage(int index) {
    return Image.network(
      '${viewModel.results[index].thumbnail!.path}.${viewModel.results[index].thumbnail!.extension}',
      fit: BoxFit.cover,
      height: kToolbarHeight,
      width: kToolbarHeight * 2,
    );
  }

  CustomText _characterName(int index) {
    return CustomText(
      textAlign: TextAlign.center,
      fontSize: 14,
      text: viewModel.results[index].name!,
      textColor: AppColors.marvelWhite,
      fontWeight: FontWeight.w500,
    );
  }

  CustomIcon _arrowIcon() {
    return const CustomIcon(
      iconData: LineIcons.angleRight,
    );
  }
}
