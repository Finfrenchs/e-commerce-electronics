// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_electronics/bloc/search/search_bloc.dart';
import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/pages/detail_product/detail_product_page.dart';
import 'package:e_commerce_electronics/presentation/widgets/custom_appbar.dart';
import 'package:e_commerce_electronics/presentation/widgets/data_not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  final String search;
  const SearchPage({
    Key? key,
    required this.search,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    searchController.text = widget.search;
    context.read<SearchBloc>().add(
          SearchEvent.search(widget.search),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 2,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: greyColor,
          ),
        ),
        title: Container(
          height: 45,
          margin: const EdgeInsets.only(right: 16),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 0,
            child: TextFormField(
              controller: searchController,
              onFieldSubmitted: (_) {
                context.read<SearchBloc>().add(
                      SearchEvent.search(searchController.text),
                    );
              }, //if enter, direct to result
              decoration: InputDecoration(
                prefixIcon: InkWell(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 6,
                    ),
                    child: Icon(
                      Icons.search_rounded,
                      color: greyColor,
                      size: 23,
                    ),
                  ),
                ),
                filled: true,
                fillColor: const Color(0xffEFEFF1),
                contentPadding: const EdgeInsets.only(top: 10),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  borderSide: BorderSide(
                    color: Color(0xffEFEFF1),
                    width: 1,
                  ),
                ),
                hintText: 'Search ',
                hintStyle: greyTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const DataNotfoundWidget();
          },
          loaded: (data) {
            return ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: data.data!.length,
                itemBuilder: (context, index) {
                  final product = data.data![index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailProductPage(product: product);
                          },
                        ),
                      );
                    },
                    child: Card(
                      shadowColor: blueColor,
                      elevation: 5,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(product.attributes!.picture!),
                        ),
                        title: Text(
                          product.attributes!.name!,
                        ),
                      ),
                    ),
                  );
                });
          },
        );
      }),
    );
  }
}
