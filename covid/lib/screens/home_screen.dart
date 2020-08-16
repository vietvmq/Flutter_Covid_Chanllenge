import 'package:covid/components/constant.dart';
import 'package:covid/components/header.dart';
import 'package:flutter/material.dart';
import 'package:covid/components/statistic.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  double offset = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (scrollController.hasClients) ? scrollController.offset : 0;
    });
  }

  Widget _buildSymptomItem({String path, String title}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              gradient: LinearGradient(
                colors: [
                  AppColors.backgroundColor,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              border: Border.all(color: Colors.white),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 3,
                )
              ],
            ),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Image.asset(BaseUrl.imagesUrl + path),
            // margin: EdgeInsets.only(right: 20),
          ),
          const SizedBox(height: 7),
          Container(
            width: 100,
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreventionItem({String path, String tilte, String subTilte}) {
    return Column(
      children: <Widget>[
        Container(
          width: 200,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 1,
              ),
            ],
          ),
          padding: EdgeInsets.all(12),
          child: Row(
            children: <Widget>[
              Image.asset(BaseUrl.imagesUrl + path),
              SizedBox(width: 10),
              RichText(
                text: TextSpan(
                    text: "$tilte\n",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: subTilte,
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ]),
              )
            ],
          ),
          margin: EdgeInsets.only(right: 20),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          controller: scrollController,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              HeaderList(
                image: "/Drcorona.svg",
                textTop: "Tất cả chúng ta",
                textBottom: "hãy hạn chế ra ngoài !",
                offset: offset,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: "Triệu chứng của ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: "COVID-19",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 170,
                child: ListView(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    _buildSymptomItem(path: "/symptom_fever.png", title: "Sốt"),
                    _buildSymptomItem(
                        path: "/symptom_dry_cough.png", title: "Ho khan"),
                    _buildSymptomItem(
                        path: "/symptom_headache.png", title: "Đau đầu"),
                    _buildSymptomItem(
                        path: "/symptom_breathless.png", title: "Khó thở"),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: "Biện pháp ngăn ngừa ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: "COVID-19",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 120,
                child: ListView(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    _buildPreventionItem(
                        path: "/prevention_gel_wash.png",
                        tilte: "THƯỜNG XUYÊN",
                        subTilte: "Rửa tay với Gel"),
                    _buildPreventionItem(
                        path: "/prevention_wash.png",
                        tilte: "HÃY",
                        subTilte: "Rửa tay sạch sẽ"),
                    _buildPreventionItem(
                        path: "/prevention_mask.png",
                        tilte: "LUÔN LUÔN",
                        subTilte: "Đeo khẩu trang"),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: "Số liệu thống kê tình trạng ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: "COVID-19",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(left: 20, top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.purple),
                      color: Colors.purple,
                    ),
                    child: Text(
                      "Việt Nam",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              CovidStatistic(
                codeArea: false,
                nameArea: "Việt Nam",
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(left: 20, top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.purple),
                      color: Colors.purple,
                    ),
                    child: Text(
                      "Thế giới",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              CovidStatistic(
                codeArea: true,
                nameArea: "Thế giới",
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
