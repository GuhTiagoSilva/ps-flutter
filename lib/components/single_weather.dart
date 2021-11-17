import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ocean_tech/model/ocean.dart';
import 'package:ocean_tech/model/ocean_custom_result.dart';
import 'package:ocean_tech/services/ocean_custom_result_service.dart';
import 'package:ocean_tech/services/ocean_service.dart';

class SingleWeather extends StatelessWidget {
  final int index;
  SingleWeather(this.index);

  @override
  Widget build(BuildContext context) {
    var oceanService = OceanCutomResultService().findAll();
    var date = new DateTime.now();
    var currentDate = new DateTime(date.year, date.month, date.day);
    var formattedDate = new DateFormat("dd/MM/yyyy").format(currentDate);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Text(
                      'Nível de PH: ' + formattedDate,
                      style: GoogleFonts.lato(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '',
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                FutureBuilder<List<OceanCustomResult>>(
                  future: oceanService,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return buildData(
                            snapshot.data as List<OceanCustomResult>, 2);
                      } else {
                        return Center(
                          child: Text("Nenhum oceano cadastrado!"),
                        );
                      }
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              ],
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 40),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FutureBuilder<List<OceanCustomResult>>(
                      future: oceanService,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            return buildOceanData(
                                snapshot.data as List<OceanCustomResult>, 0);
                          } else {
                            return Center(
                              child: Text("Nenhum oceano cadastrado!"),
                            );
                          }
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                    FutureBuilder<List<OceanCustomResult>>(
                      future: oceanService,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            return buildOceanData(
                                snapshot.data as List<OceanCustomResult>, 2);
                          } else {
                            return Center(
                              child: Text("Nenhum oceano cadastrado!"),
                            );
                          }
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                    FutureBuilder<List<OceanCustomResult>>(
                      future: oceanService,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            return buildOceanData(
                                snapshot.data as List<OceanCustomResult>, 3);
                          } else {
                            return Center(
                              child: Text("Nenhum oceano cadastrado!"),
                            );
                          }
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column buildData(List<OceanCustomResult> oceans, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          oceans[index].ph.toString(),
          style: GoogleFonts.lato(
            fontSize: 85,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/moon.svg',
              width: 34,
              height: 34,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              oceans[1].ocean as String,
              style: GoogleFonts.lato(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column buildOceanData(List<OceanCustomResult> oceans, int index) {
    return Column(
      children: [
        Text(
          oceans[index].ocean.toString().replaceAll("Oceano", ""),
          style: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.0),
          child: Text(
            oceans[index].ph.toString(),
            style: GoogleFonts.lato(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
