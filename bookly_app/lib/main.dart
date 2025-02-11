import 'package:bookly_app/core/utlis/approuter.dart';
import 'package:bookly_app/core/utlis/constants.dart';
import 'package:bookly_app/core/utlis/service_locator.dart';
import 'package:bookly_app/core/utlis/simple_bloc_observer.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/presentaion/manager/fetch_best_seller_cubit/fetch_best_seller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(kBoxNameF);
  await Hive.openBox(kBoxNameN);
  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FetchBestSellerCubit(getIt<HomeRepoImp>()),)
      ],
      child: MaterialApp.router(
        routerConfig: Approuter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Scolor,
            brightness: Brightness.dark,
            fontFamily: 'Montserrat'),
      ),
    );
  }
}
