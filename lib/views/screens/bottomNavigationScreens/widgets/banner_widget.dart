import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maclay_shop_node_project/provider/banner_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bannerProvider = Provider.of<BannerProvider>(context);

    // Load banners if not already loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!bannerProvider.isLoading && bannerProvider.banners.isEmpty) {
        bannerProvider.loadBanners();
      }
    });

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: bannerProvider.isLoading
          ? _buildShimmerBanner(context)
          : bannerProvider.banners.isEmpty
              ? const Center(
                  child:
                      CircularProgressIndicator()) // Display a loading indicator
              : PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bannerProvider.banners.length,
                  itemBuilder: (context, index) {
                    final bannerData = bannerProvider.banners[index];
                    return AspectRatio(
                      aspectRatio: MediaQuery.of(context).size.width /
                          150, // Adjust aspectRatio
                      child: CachedNetworkImage(
                        imageUrl: bannerData.image,
                        placeholder: (context, url) => Container(
                          color: Colors.grey[200],
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover, // Use BoxFit.cover to fill the space
                      ),
                    );
                  },
                ),
    );
  }

  Widget _buildShimmerBanner(context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      period: const Duration(
          milliseconds: 1500), // Adjust the period for shimmer animation
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.grey[200]!,
              Colors.grey[300]!,
              Colors.grey[200]!,
            ],
            stops: const [0.4, 0.5, 0.6],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 16.0,
                color: Colors.white,
              ),
              const SizedBox(height: 12.0),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 12.0,
                color: Colors.white,
              ),
              const SizedBox(height: 8.0),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 12.0,
                color: Colors.white,
              ),
              const SizedBox(height: 16.0),
              Container(
                width: double.infinity,
                height: 24.0,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
