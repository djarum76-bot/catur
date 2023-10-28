import 'package:catur/features/chess/bloc/chess_bloc.dart';
import 'package:catur/features/chess/models/chess_model.dart';
import 'package:catur/utils/injector.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDialog{
  static Future<void> chessDialog(BuildContext context, List<ChessModel> pieces) async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: (){
              return Future.value(false);
            },
            child: Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 4.5.w, vertical: 2.5.h),
                  child: ListView.builder(
                    itemCount: pieces.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        onTap: (){
                          injector<ChessBloc>().add(ChessRespawned(pieces[index]));
                          Navigator.pop(context);
                        },
                        leading: Image.asset(pieces[index].chessImage, width: 6.w, height: 3.h,),
                        title: Text(
                          pieces[index].type.name,
                          style: GoogleFonts.plusJakartaSans(),
                        ),
                      );
                    },
                  )
              ),
            ),
          );
        });
  }
}