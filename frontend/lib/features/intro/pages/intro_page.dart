import 'package:flutter/material.dart';
import 'package:nowaste_app/core/configs/app_colors.dart';
import 'package:nowaste_app/core/extensions/navx.dart';
import 'package:nowaste_app/features/home/pages/home_page.dart';
import 'package:nowaste_app/features/intro/widgets/next_button.dart';

class IntroPage extends StatefulWidget {
  static const String routeName = '/intro-page';
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _controller = PageController();
  int _current = 0;

  // final List<Map<String, String>> _pages = [
  //   {
  //     "title": "TRACK",
  //     "text": "Keep an eye on your fridge items easily.",
  //   },
  //   {
  //     "title": "REMIND",
  //     "text": "Get notified before products expire.",
  //   },
  //   {"title": "SAVE", "text": "Use what you have and reduce waste."},
  // ];

  final _pages = const [
    ('TRACK', 'Keep an eye on your fridge items easily.'),
    ('REMIND', 'Get notified before products expire.'),
    ('SAVE', 'Use what you have and reduce waste.'),
  ];

  Widget _buildDots() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        _pages.length,
        (i) => AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          height: 10,
          width: _current == i ? 26 : 10,
          decoration: BoxDecoration(
            color:
                _current == i
                    ? AppColors.primary
                    : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              context.replaceWith(HomePage.routeName);
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 18,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Основной контент страниц
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged:
                    (index) => setState(() => _current = index),
                itemBuilder:
                    (_, i) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 12),
                        Text(
                          _pages[i].$1,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _pages[i].$2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        // добавим Spacer, чтобы контент не прилипал сверху
                        const Spacer(),
                      ],
                    ),
              ),
            ),
          ),

          // Нижняя панель навигации (между низом и центром)
          Align(
            alignment: const Alignment(
              0,
              0.75,
            ), // ниже центра, выше низа
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                // height: 60,
                // width: double.infinity,
                child: Stack(
                  children: [
                    // Центр: индикаторы-точки
                    Align(
                      alignment: Alignment.center,
                      child: _buildDots(),
                    ),
                    // Справа: NextButton
                    Align(
                      alignment: Alignment.centerRight,
                      child: NextButton(
                        onTap: () {
                          if (_current < _pages.length - 1) {
                            _controller.nextPage(
                              duration: const Duration(
                                milliseconds: 450,
                              ),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            // Navigator.pushReplacementNamed(context, HomePage.routeName);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
