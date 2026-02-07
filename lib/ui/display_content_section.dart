import 'package:flutter/material.dart';

class DisplayContentSection extends StatefulWidget {
  const DisplayContentSection({super.key});

  @override
  State<DisplayContentSection> createState() => _DisplayContentSectionState();
}

class _DisplayContentSectionState extends State<DisplayContentSection> {
  //Stream? contentStream;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'View Content',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        Container(
          margin: EdgeInsets.only(top: 10,bottom: 10),
          child: Card(
            elevation: 5,
            shadowColor: Colors.black,
            color: const Color.fromARGB(255, 219, 223, 248),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              //height: 200,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      width: MediaQuery.of(context).size.width * 0.8,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://content.pexels.com/images/canva/ai-generated-ad/off-theme/white_water_lily-full.jpg",
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Beauty Of Nature!!",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 3, 13, 67))),
                    SizedBox(height: 10),
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 80, 80, 81)))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
