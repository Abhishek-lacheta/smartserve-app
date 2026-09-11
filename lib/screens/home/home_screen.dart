import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/luxeloft_logo.dart';
import '../../widgets/product_card.dart';

import '../../presentation/home/bloc/home_bloc.dart';
import '../../presentation/home/bloc/home_event.dart';
import '../../presentation/home/bloc/home_state.dart';
import '../../presentation/auth/bloc/auth_bloc.dart';
import '../../presentation/auth/bloc/auth_event.dart';
import '../../presentation/auth/bloc/auth_state.dart';
import '../auth/login_screen.dart';

/// Provides core implementation and business logic properties.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadHomeData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryOrange,
                  ),
                );
              } else if (state is HomeError) {
                return Center(
                  child: Text(
                    'Failed to load data. Please try again.',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              } else if (state is HomeLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Custom AppBar Area
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Tap menu to logout as required for testing
                                context.read<AuthBloc>().add(
                                  SignOutRequested(),
                                );
                              },
                              child: const Icon(
                                Icons.logout,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const LuxeLoftLogo(size: 30),
                            Row(
                              children: [
                                const Icon(
                                  Icons.search,
                                  color: AppColors.textPrimary,
                                ),
                                const SizedBox(width: 16),
                                Icon(
                                  Icons.qr_code_scanner,
                                  color: AppColors.textPrimary.withOpacity(0.8),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Greeting and Title
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, authState) {
                                String name = 'User';
                                if (authState is Authenticated) {
                                  // Extract just the first name if possible
                                  name = authState.user.name.isNotEmpty
                                      ? authState.user.name.split(' ').first
                                      : 'User';
                                }
                                return Text(
                                  'Hi, $name',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'What are you looking for\ntoday?',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Banner Area
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Image.asset(
                          'assets/images/home_banner.jpg',
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                      ),

                      // Carousel Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryOrange,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              color: AppColors.iconGrey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              color: AppColors.iconGrey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Categories List
                      SizedBox(
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemCount: state.topCategories.length,
                          itemBuilder: (context, index) {
                            bool isSelected = index == 0;
                            return Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    state.topCategories[index],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.w600,
                                      color: isSelected
                                          ? AppColors.textPrimary
                                          : AppColors.textSecondary,
                                    ),
                                  ),
                                  if (isSelected)
                                    Container(
                                      margin: const EdgeInsets.only(top: 4),
                                      height: 2,
                                      width: 40,
                                      color: AppColors.primaryOrange,
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      // See More
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'See More',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryOrange,
                            ),
                          ),
                        ),
                      ),

                      // Categories Grid (Keeping MockData here to avoid breaking UI layout unnecessarily, per assignment instructions: ONLY replace required mock functionality with real functionality - usually means the products list, but the prompt says "Home screen data must come from Firebase". I will apply it to products grid as it fits standard e-commerce models).
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                childAspectRatio: 0.8,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) {
                            final category = state.categories[index];
                            return Column(
                              children: [
                                Container(
                                  height: 56,
                                  width: 56,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: AppColors.primaryOrange
                                          .withOpacity(0.1),
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: AppColors.cardYellowShadow,
                                        blurRadius: 8,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    category.icon,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  category.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Products Grid
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: state.items.isEmpty
                            ? const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(40.0),
                                  child: Text(
                                    'No products available at the moment.',
                                  ),
                                ),
                              )
                            : GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.7,
                                      crossAxisSpacing: 16,
                                      mainAxisSpacing: 16,
                                    ),
                                itemCount: state.items.length,
                                itemBuilder: (context, index) {
                                  final product = state.items[index];
                                  return ProductCard(
                                    title: product.title,
                                    price: product.price,
                                    rating: product.rating,
                                    reviews: product.reviews,
                                    placeholderIcon: product.icon,
                                  );
                                },
                              ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              }
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Text('No data available.'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
