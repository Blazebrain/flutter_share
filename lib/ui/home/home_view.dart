import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:flutter_share/models/fish_response_model.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (viewModel) => viewModel.getFishSpecies(),
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
              backgroundColor: Colors.grey[300],
              appBar: AppBar(
                backgroundColor: Colors.green,
                centerTitle: true,
                title: const Text(
                  'Fish Species',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: viewModel.isBusy
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: viewModel.fishSpeciesList!.length,
                            itemBuilder: (context, index) {
                              return FishSpecieTile(
                                fishSpecieModel:
                                    viewModel.fishSpeciesList![index],
                                homeViewModel: viewModel,
                              );
                            },
                          ),
                  ),
                ],
              )),
        );
      },
    );
  }
}

class FishSpecieTile extends StatelessWidget {
  final FishResponseModel? fishSpecieModel;
  final HomeViewModel? homeViewModel;
  const FishSpecieTile({
    Key? key,
    this.homeViewModel,
    this.fishSpecieModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                      image: NetworkImage(
                        fishSpecieModel!.speciesIllustrationPhoto!.src!,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(fishSpecieModel!.speciesName!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(height: 8),
                      Text(
                        'Protein: ${fishSpecieModel!.protein!}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Quote: ${fishSpecieModel!.quote!}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(color: Colors.grey[600]),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.share, size: 18),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    homeViewModel!.shareFishSeries(fishSpecieModel!);
                  },
                  child: const Text(
                    'Share',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
