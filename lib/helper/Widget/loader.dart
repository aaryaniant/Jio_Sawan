import 'package:flutter/material.dart';

Widget loader(context){
  return  Container(
                          height: MediaQuery.of(context).size.height / 1.2,
                          child: Center(
                            child: Container(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                  strokeWidth: 2,
                                )),
                          ),
                        );
}