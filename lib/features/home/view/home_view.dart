import 'package:bloc_learning/features/cart/view/cart_view.dart';
import 'package:bloc_learning/features/home/bloc/home_bloc.dart';
import 'package:bloc_learning/features/wishlist/view/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc();
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is ActionHomeState,
      buildWhen: (previous, current) => current is! ActionHomeState,
      listener: (context, state) {
        if (state is HomeNavigatetoWishlistPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WishlistView()));
        } else if (state is HomeNavigatetoCartPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartView()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Bloc State Management"),
            actions: [
              IconButton(
                  onPressed: () =>
                      homeBloc.add(HomeWishlistButtonNavigateEvent()),
                  icon: const Icon(Icons.favorite)),
              IconButton(
                  onPressed: () => homeBloc.add(HomeCartButtonNavigateEvent()),
                  icon: const Icon(Icons.shopping_bag_outlined)),
            ],
          ),
          body: const Center(
            child: Text("Home View"),
          ),
        );
      },
    );
  }
}
