// import 'package:e_commerce_bloc/common/bloc/button/button_cubit.dart';
// import 'package:e_commerce_bloc/common/bloc/button/button_state.dart';
// import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
// import 'package:e_commerce_bloc/core/theme/app_colors.dart';
// import 'package:e_commerce_bloc/core/widgets/app_bar.dart';
// import 'package:e_commerce_bloc/core/widgets/buttons/basic_app_button.dart';
// import 'package:e_commerce_bloc/data/order/models/add_to_cart.dart';
// import 'package:e_commerce_bloc/domain/order/usecases/add_to_cart.dart';
// import 'package:e_commerce_bloc/domain/products/entity/product_entity.dart';
// import 'package:e_commerce_bloc/presentation/cart/page/cart_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// // ignore: must_be_immutable
// class ProductDetailsScreen extends StatefulWidget {
//   ProductDetailsScreen({super.key, required this.productEntity});
//   ProductEntity productEntity;

//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }

// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   late String selectedSize;
//   late String selectedColor;
//   int selectedQuantity = 1;
//   late ProductEntity productEntity;

//   @override
//   void initState() {
//     selectedSize = widget.productEntity.sizes.first;
//     selectedColor = widget.productEntity.colors.first.hexCode;
//     super.initState();
//   }

//   Color hexToColor(String hexCode) {
//     if (hexCode.isEmpty) return Colors.black;
//     hexCode = hexCode.replaceAll('#', '');
//     if (hexCode.length == 6) return Color(int.parse('FF$hexCode', radix: 16));
//     if (hexCode.length == 8) return Color(int.parse(hexCode, radix: 16));
//     return Colors.black;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const BasicAppbar(),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.only(bottom: 24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // 🖼 Product Image
//                   Container(
//                     color: AppColors.secondBackground,
//                     child: AspectRatio(
//                       aspectRatio: 1.5,
//                       child: Image.asset(
//                         "assets/products/${widget.productEntity.image}",
//                         fit: BoxFit.contain,
//                         width: double.infinity,
//                         errorBuilder: (context, error, stackTrace) =>
//                             const Icon(Icons.error),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 16),

//                   // Title, Price, Pickers...
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Text(widget.productEntity.title,
//                         style: const TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold)),
//                   ),
//                   const SizedBox(height: 8),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Text(
//                       "\$${widget.productEntity.price}",
//                       style: const TextStyle(
//                         fontSize: 18,
//                         color: AppColors.primary,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   _buildExpandableSelector(
//                     label: 'Size',
//                     value: selectedSize,
//                     items: widget.productEntity.sizes,
//                     onSelect: (val) => setState(() => selectedSize = val),
//                   ),
//                   _buildExpandableSelector(
//                     label: 'Color',
//                     value: selectedColor,
//                     items: widget.productEntity.colors
//                         .map((e) => e.hexCode)
//                         .toList(),
//                     isColor: true,
//                     onSelect: (val) => setState(() => selectedColor = val),
//                   ),
//                   _buildQuantitySelector(),
//                 ],
//               ),
//             ),
//           ),

//           // ✅ Fixed Bottom Button
//           BlocProvider(
//               create: (context) => ButtonCubit(),
//               child: BlocBuilder<ButtonCubit, ButtonState>(
//                 builder: (context, state) {
//                   if (state is ButtonLoadingState) {
//                     return const CircularProgressIndicator();
//                   }
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 25),
//                     child: BasicAppButton(
//                       onPressed: () {
//                         context.read<ButtonCubit>().execute(
//                               useCase: AddToCartUsecase(),
//                               params: AddToCartReq(
//                                 createdDate: DateTime.now().toString(),
//                                 productImage: productEntity.image,
//                                 productId: productEntity.productId,
//                                 productTitle: productEntity.title,
//                                 productSize: selectedSize,
//                                 productColor: selectedColor,
//                                 productQuantity: selectedQuantity,
//                                 mainPrice: productEntity.price,
//                                 totalPrice: double.parse(productEntity.price) *
//                                     selectedQuantity,
//                               ),
//                             );
//                       },
//                       content: Row(
//                         children: [
//                           Text(
//                             "\$${int.parse(widget.productEntity.price) * selectedQuantity}",
//                             style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                           const Spacer(),
//                           const Text(
//                             "Add to Bag",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               )),
//         ],
//       ),
//     );
//   }

//   Widget _buildQuantitySelector() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//         decoration: BoxDecoration(
//           color: AppColors.secondBackground,
//           borderRadius: BorderRadius.circular(32),
//         ),
//         child: Row(
//           children: [
//             const Text(
//               "Quantity",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 14,
//               ),
//             ),
//             Spacer(),
//             // ➕ Button
//             _circleButton(Icons.add, () {
//               if (selectedQuantity < 10) {
//                 setState(() => selectedQuantity++);
//               }
//             }),

//             const SizedBox(width: 12),

//             // Quantity number
//             Text(
//               '$selectedQuantity',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),

//             const SizedBox(width: 12),

//             // ➖ Button
//             _circleButton(Icons.remove, () {
//               if (selectedQuantity > 1) {
//                 setState(() => selectedQuantity--);
//               }
//             }),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _circleButton(IconData icon, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 40,
//         height: 40,
//         decoration: const BoxDecoration(
//           color: AppColors.primary,
//           shape: BoxShape.circle,
//         ),
//         child: Icon(icon, color: Colors.white, size: 20),
//       ),
//     );
//   }

//   Widget _buildExpandableSelector({
//     required String label,
//     required String value,
//     required List<String> items,
//     required ValueChanged<String> onSelect,
//     bool isColor = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//       child: Container(
//         decoration: BoxDecoration(
//           color: AppColors.secondBackground,
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: ExpansionTile(
//           tilePadding: const EdgeInsets.symmetric(horizontal: 16),
//           title: Row(
//             children: [
//               Text(label, style: const TextStyle(color: Colors.white)),
//               const Spacer(),
//               isColor
//                   ? Container(
//                       width: 16,
//                       height: 16,
//                       decoration: BoxDecoration(
//                         color: hexToColor(value),
//                         shape: BoxShape.circle,
//                         border: Border.all(color: Colors.white),
//                       ),
//                     )
//                   : Text(value,
//                       style: const TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold)),
//             ],
//           ),
//           children: items.map((item) {
//             final isSelected = item == value;
//             return ListTile(
//               title: isColor
//                   ? Row(
//                       children: [
//                         Text(
//                           widget.productEntity.colors
//                               .firstWhere((c) => c.hexCode == item)
//                               .title,
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                         const Spacer(),
//                         Container(
//                           width: 16,
//                           height: 16,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: hexToColor(item),
//                           ),
//                         )
//                       ],
//                     )
//                   : Text(item, style: const TextStyle(color: Colors.white)),
//               trailing: isSelected
//                   ? const Icon(Icons.check, color: AppColors.primary)
//                   : null,
//               onTap: () => onSelect(item),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }

import 'package:e_commerce_bloc/common/bloc/button/button_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/button/button_state.dart';
import 'package:e_commerce_bloc/core/helper/color_utils.dart';
import 'package:e_commerce_bloc/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_bloc/core/theme/app_colors.dart';
import 'package:e_commerce_bloc/core/widgets/app_bar.dart';
import 'package:e_commerce_bloc/core/widgets/buttons/basic_app_button.dart';
import 'package:e_commerce_bloc/data/order/models/add_to_cart.dart';
import 'package:e_commerce_bloc/domain/order/usecases/add_to_cart.dart';
import 'package:e_commerce_bloc/domain/products/entity/product_entity.dart';
import 'package:e_commerce_bloc/presentation/cart/page/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductEntity productEntity;

  const ProductDetailsScreen({super.key, required this.productEntity});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late ProductEntity product;
  late String selectedSize;
  late String selectedColor;
  int selectedQuantity = 1;

  @override
  void initState() {
    super.initState();
    product = widget.productEntity;
    selectedSize = product.sizes.first;
    selectedColor = product.colors.first.title;
    selectedColor = product.colors.first.hexCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProductImage(),
                  const SizedBox(height: 16),
                  _buildTitleAndPrice(),
                  const SizedBox(height: 16),
                  _buildExpandableSelector(
                    label: 'Size',
                    value: selectedSize,
                    items: product.sizes,
                    onSelect: (val) => setState(() => selectedSize = val),
                  ),
                  _buildExpandableSelector(
                    label: 'Color',
                    value: selectedColor,
                    items: product.colors.map((e) => e.hexCode).toList(),
                    isColor: true,
                    onSelect: (val) => setState(() => selectedColor = val),
                  ),
                  _buildQuantitySelector(),
                ],
              ),
            ),
          ),
          _buildAddToCartButton(),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      color: AppColors.secondBackground,
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Image.asset(
          "assets/products/${product.image}",
          fit: BoxFit.contain,
          width: double.infinity,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        ),
      ),
    );
  }

  Widget _buildTitleAndPrice() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(
            "\$${product.price}",
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          children: [
            const Text(
              "Quantity",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const Spacer(),
            _circleButton(Icons.add, () {
              if (selectedQuantity < 10) {
                setState(() => selectedQuantity++);
              }
            }),
            const SizedBox(width: 12),
            Text('$selectedQuantity',
                style: const TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(width: 12),
            _circleButton(Icons.remove, () {
              if (selectedQuantity > 1) {
                setState(() => selectedQuantity--);
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildExpandableSelector({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String> onSelect,
    bool isColor = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(50),
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16),
          title: Row(
            children: [
              Text(label, style: const TextStyle(color: Colors.white)),
              const Spacer(),
              isColor
                  ? Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: hexToColor(value),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                      ),
                    )
                  : Text(value,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          children: items.map((item) {
            final isSelected = item == value;
            return ListTile(
              title: isColor
                  ? Row(
                      children: [
                        Text(
                          product.colors
                              .firstWhere((c) => c.hexCode == item)
                              .title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Spacer(),
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: hexToColor(item),
                          ),
                        )
                      ],
                    )
                  : Text(item, style: const TextStyle(color: Colors.white)),
              trailing: isSelected
                  ? const Icon(Icons.check, color: AppColors.primary)
                  : null,
              onTap: () => onSelect(item),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildAddToCartButton() {
    return BlocProvider(
      create: (_) => ButtonCubit(),
      child: BlocListener<ButtonCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonSuccessState) {
            AppNavigator.push(context, const CartPage());
          }
          if (state is ButtonErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<ButtonCubit, ButtonState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
              child: BasicAppButton(
                isLoading: state is ButtonLoadingState,
                onPressed: () {
                  context.read<ButtonCubit>().execute(
                        useCase: AddToCartUsecase(),
                        params: AddToCartReq(
                          createdDate: DateTime.now().toString(),
                          productImage: product.image,
                          productId: product.productId,
                          productTitle: product.title,
                          productSize: selectedSize,
                          productColor: selectedColor,
                          productQuantity: selectedQuantity,
                          mainPrice: product.price,
                          totalPrice:
                              double.parse(product.price) * selectedQuantity,
                        ),
                      );
                },
                content: Row(
                  children: [
                    Text(
                      "\$${int.parse(product.price) * selectedQuantity}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    const Text(
                      "Add to Bag",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
