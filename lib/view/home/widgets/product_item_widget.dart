import 'package:boost_test/models/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:boost_test/view/recources/values_manager.dart';
import 'package:boost_test/view/widgets/rating_bar.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductsDataModel product;
  final String? previousPath;

  const ProductItemWidget({
    super.key,
    required this.product,
    this.previousPath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(AppSizeR.s8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 8.0,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, 
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSizeR.s8),
                  topRight: Radius.circular(AppSizeR.s8),
                ),
                child: CachedNetworkImage(
                  width: double.infinity,
                  fit: BoxFit.cover, 
                  placeholder: (context, url) => Container(
                    width: double.infinity,
                    height: 200, 
                    color: Colors.grey[200], 
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: double.infinity,
                    height: 200, 
                    color: Colors.grey[200], 
                    child: const Center(
                      child: Icon(Icons.error, color: Colors.red),
                    ),
                  ),
                  
                  imageUrl: product.images.first, 
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizeW.s8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: AppSizeH.s4),
                    Text(
                      product.description,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(height: AppSizeH.s4),
               Text('\$${product.price.toString()}',
                 

                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: AppSizeH.s4),
                    RatingBarWidget(
                      rateValue: product.rating
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
