import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

Future<void> bottomSheetForSpotify({

  required BuildContext context,
  required String image,
  required String songName,
  required String atristName,

}){
  return showModalBottomSheet(context: context, builder: (context) {
    return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      color: const Color.fromARGB(255, 24, 24, 24),
    ),
      // height: MediaQuery.of(context).size.height * .3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 20,),

          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * .5,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          const SizedBox(height: 30,),

          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Listening to Spotify", style: GoogleFonts.poppins(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
          ),

          const SizedBox(height: 10,),

          Container(
            alignment: Alignment.center,
            height: 150,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
                opacity: .4,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.all(15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)
                    ),
                  )
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(songName, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                        const SizedBox(height: 5,),
                        Text(atristName, style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 10,),

          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text("Join With Rosh", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  });
}