import 'package:e_commerce_electronics/bloc/checkout/checkout_bloc.dart';
import 'package:e_commerce_electronics/bloc/get_products/get_products_bloc.dart';
import 'package:e_commerce_electronics/bloc/list_order/list_order_bloc.dart';
import 'package:e_commerce_electronics/bloc/login/login_bloc.dart';
import 'package:e_commerce_electronics/bloc/order/order_bloc.dart';
import 'package:e_commerce_electronics/bloc/register/register_bloc.dart';
import 'package:e_commerce_electronics/bloc/search/search_bloc.dart';
import 'package:e_commerce_electronics/data/datasources/auth_remote_datasource.dart';
import 'package:e_commerce_electronics/data/datasources/order_remote_datasource.dart';
import 'package:e_commerce_electronics/data/datasources/product_remote_datasource.dart';
import 'package:e_commerce_electronics/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetProductsBloc(
            ProductRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(
            AuthRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => OrderBloc(
            OrderRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(
            AuthRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => SearchBloc(
            ProductRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => ListOrderBloc(
            OrderRemoteDatasource(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
