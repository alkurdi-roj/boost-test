import 'package:boost_test/models/models/login_model.dart';
import 'package:boost_test/view/app_bloc/bloc/app_bloc.dart';
import 'package:boost_test/view/home/bloc/products_bloc.dart';
import 'package:boost_test/view/home/widgets/product_item_widget.dart';
import 'package:boost_test/view/recources/color_manager.dart';
import 'package:boost_test/view/recources/values_manager.dart';
import 'package:boost_test/view/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final ProductsDataModel productsDataModel;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle the navigation logic here if necessary
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(AppSizeH.s56),
              child: AppBar(
                backgroundColor: Colors.white,
                // leading: IconButton(
                //   icon: Icon(Icons.menu),
                //   onPressed: () {},
                // ),
                leading: SvgPicture.asset(
                  'assets/icons/menu.svg',
                  width: AppSizeW.s20,
                  height: AppSizeH.s20,
                ),
                title: Text(state.userData.firstName),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(state.userData.image),
                    ),
                  ),
                ],
              )),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/home 1.svg",
                  color: _selectedIndex == 0 ? ColorManager.pink : Colors.black,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/heart 1.svg",
                  color: _selectedIndex == 1 ? ColorManager.pink : Colors.black,
                ),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/shopping-cart 2.svg",
                  color: _selectedIndex == 2 ? ColorManager.pink : Colors.black,
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/search 1.svg",
                  color: _selectedIndex == 3 ? ColorManager.pink : Colors.black,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/settings.svg",
                  color: _selectedIndex == 4 ? ColorManager.pink : Colors.black,
                ),
                label: 'Settings',
              ),
            ],
            selectedItemColor: ColorManager.pink,
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
          ),
          body: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if(state.productsStateStatus == ProductsStateStatus.loading || state.productsStateStatus == ProductsStateStatus.init){
          return Center(child: const CircularProgressIndicator());
        }else if(state.productsStateStatus == ProductsStateStatus.error){
          return Center(
            child: CustomButton(onPressed: (){
            context.read<ProductsBloc>().add(GetProductsEvent());
          }, text: 'retry',),
           );
        }
              return SingleChildScrollView(
                padding: EdgeInsets.all(AppSizeSp.s16),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ProductsGridView(products: productsDataModel),
                    GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .71,
          mainAxisSpacing: AppSizeH.s8,
          crossAxisSpacing: AppSizeW.s8),
      itemCount: state.productsData.products.length,
      itemBuilder: (context, index) =>
          ProductItemWidget(product: state.productsData.products[index]),
    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
