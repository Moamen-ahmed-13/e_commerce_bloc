import 'package:e_commerce_bloc/core/theme/app_colors.dart';
import 'package:e_commerce_bloc/domain/products/entity/product_entity.dart';
import 'package:e_commerce_bloc/presentation/product_details/bloc/fav_icon_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FavoriteButton extends StatelessWidget {
  final ProductEntity productEntity;
  const FavoriteButton({
    required this.productEntity,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<FavIconCubit>().onTap(productEntity);
      },
      icon: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
            color: AppColors.secondBackground,
            shape: BoxShape.circle
          ),
          child: BlocBuilder<FavIconCubit,bool>(
            builder: (context,state) => Icon(
             state ? Icons.favorite : Icons.favorite_outline,
              size: 15,
              color: Colors.white
            ),
          ),
      ),
    );
  }
}