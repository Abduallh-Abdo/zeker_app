import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeker_app/config/routes/app_routes.dart';
import 'package:zeker_app/core/utils/app_colors.dart';
import 'package:zeker_app/core/utils/media_query_values.dart';
import 'package:quran/quran.dart' as quran;
import 'package:zeker_app/features/search/presentation/cubit/search_cubit.dart';

class SearchListViewItem extends StatelessWidget {
  const SearchListViewItem({
    super.key,
    required this.surahNumber,
    required this.verseNumber,
    required this.isPlaying,
  });

  final int surahNumber;
  final int verseNumber;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(
          AppRoutes.surahView,
          extra: surahNumber,
        );
      },
      child: Container(
        width: context.width,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey[100]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  isPlaying ? Icons.stop_rounded : Icons.play_arrow,
                  color: AppColors.primaryColor,
                  size: 30,
                ),
                onPressed: () {
                  BlocProvider.of<SearchCubit>(context)
                      .playAudio(verseNumber: verseNumber);
                },
              ),
              Expanded(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        quran.getSurahNameArabic(surahNumber),
                        style: GoogleFonts.amiri().copyWith(
                          color: AppColors.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        quran.getVerse(surahNumber, verseNumber),
                        style: GoogleFonts.amiri(
                          color: AppColors.colorBlack,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
