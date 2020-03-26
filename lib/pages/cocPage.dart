import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'manageCOC.dart';

class COCPage extends StatefulWidget {
  @override
  _COCPageState createState() => _COCPageState();
}

class _COCPageState extends State<COCPage> {
  var details;
  List cocGuideLines = List();

  getDetails() async{
    var ref = Firestore.instance;
    details = await ref.collection("details").document("details").get();
    for (var item in details["coc"]) {
      var temp = myText(item["name"], item["des"]);
      cocGuideLines.add(temp);
    }
    setState(() {
      
    });
  }

  @override
  void initState() {
    getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: details == null ? Center(child: CircularProgressIndicator(),) : Container(
        color: Colors.grey[200],
        constraints: BoxConstraints.expand(),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 30.0, 10.0, 10.0),
              child: Text('Community Guidelines',
                  style: GoogleFonts.lato(
                      fontSize: 25.0, color: Color.fromRGBO(2, 119, 189, 0.8))),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Colors.grey[100],
                child: Column(
                  children: <Widget>[
                    for (var item in cocGuideLines) item,
                    Divider(
                      color: Colors.grey,
                      height: 0.0,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 30.0, 10.0, 10.0),
              child: Text('Code of conduct',
                  style: GoogleFonts.lato(
                      fontSize: 25.0, color: Color.fromRGBO(2, 119, 189, 0.8))),
            ),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'When you join our programs, you’re joining a community. And like any growing community, a few ground rules about expected behavior are good for everyone. These guidelines cover both online (e.g. mailing lists, social channels) and offline (e.g. in-person meetups) behavior. Violations of this code of conduct can result in members being removed from the program. Use your best judgement, and if you’d like more clarity or have questions feel free to reach out.',
                  style: GoogleFonts.lato(fontSize: 15.0, height: 1.5),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 30.0, 10.0, 10.0),
              child: Text('Anti-Harassment Policy',
                  style: GoogleFonts.lato(
                      fontSize: 25.0, color: Color.fromRGBO(2, 119, 189, 0.8))),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Text(
                      'Why do we have an official Anti-Harassment policy for ${details['name']} events?',
                      style: GoogleFonts.lato(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          height: 1.5)),
                  Text(""),
                  Text(
                    '• It sets expectations for behavior at the event. Simply having an anti-harassment policy can prevent harassment.',
                    style: GoogleFonts.lato(fontSize: 15.0, height: 1.5),
                  ),
                  Text(
                    '• It encourages people to attend who have had bad experiences at other events.',
                    style: GoogleFonts.lato(fontSize: 15.0, height: 1.5),
                  ),
                  Text(
                    '• It gives event staff/volunteers instructions on how to handle harassment quickly, with minimum amount of disruption for the event.',
                    style: GoogleFonts.lato(fontSize: 15.0, height: 1.5),
                  ),
                  Text(""),
                  Text(
                      '${details['name']} is dedicated to providing a harassment-free event experience for everyone, regardless of:',
                      style: GoogleFonts.lato(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          height: 1.5)),
                  Text(""),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '• Gender \n• Sexual Orientation \n• Disability \n• Gender Identity\n• Age\n• Race\n• Religion\n• Nationality',
                      style: GoogleFonts.lato(fontSize: 15.0, height: 1.5),
                    ),
                  ),
                  Text(
                    'The above is not an exhaustive list -- we do not tolerate harassment of event spanarticipants in any form.',
                    style: GoogleFonts.lato(fontSize: 15.0, height: 1.5),
                  ),
                  Text(""),
                  Text(
                    'Sexual language and imagery is not appropriate for any event venue, including talks. Event participants violating these rules may be expelled from the event, and event banned from future events at the discretion of the event organizers/management.',
                    style: GoogleFonts.lato(fontSize: 15.0, height: 1.5),
                  ),
                  Text(""),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Harassment includes (but is not limited to):',
                      style: GoogleFonts.lato(fontSize: 15.0, height: 1.5),
                    ),
                  ),
                  Text(""),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '• Offensive verbal comments related to gender, sexual orientation, disability, gender identity, age, race, religion \n• The use or display of sexual images in public spaces \n• Deliberate intimidation \n• Stalking \n• Harassing photography or recording \n• Sustained disruption of talks or other events\n• Inappropriate physical contact \n• Unwelcome sexual attention',
                      style: GoogleFonts.lato(fontSize: 15.0, height: 1.5),
                    ),
                  ),
                  Text(""),
                  Text(
                    'Participants asked to stop any harassing behavior are expected to comply immediately.',
                    style: GoogleFonts.lato(fontSize: 15.0, height: 1.5),
                  ),
                  Text(""),
                  Text(
                    'Exhibiting partners and guests are also subject to the anti-harassment policy. In particular, exhibitors and speakers should not use sexualized images, activities, or other material, or otherwise create a sexualized environment in their slide decks, exhibit material, exhibit staffing, promotional items or demo material.',
                    style: GoogleFonts.lato(fontSize: 15.0, height: 1.5),
                  ),
                  Text(""),
                  Text(
                    'If you are being harassed, notice that someone else is being harassed, or have any other concerns, please contact an organizer or event volunteer immediately. Organizers and event volunteers may be identified by t-shirts or special badges/lanyards. Organizers will investigate the issue and take appropriate action. This may include helping participants contact venue security or local law enforcement, provide escorts, or otherwise assist these experiencing harassment to fell safe for the duration of the event.',
                    style: GoogleFonts.lato(fontSize: 15.0, height: 1.5),
                  ),
                  Text(""),
                  Text(
                    'Though we hope that we never have to invoke this policy, we believe that having this document helps everyone think a little more about how their actions and words affect the whole community, as well as individuals in the community.',
                    style: GoogleFonts.lato(fontSize: 15.0, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => ManageCommunityGuidelinesScreen()
            )
          );
        },
        icon: Icon(Icons.list),
        label: Text(
          "Manage Guidelines"
        ),
      ),
    );
  }
}

Widget myText(String a, String b) {
  return ExpansionTile(
    title: Text(a,
        style: GoogleFonts.lato(
          color: Colors.black,
        )),
    children: <Widget>[
      Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child:
                Text(b, style: GoogleFonts.lato(fontSize: 15.0, height: 1.5)),
          ))
    ],
  );
}

class Bullet extends Text {
  const Bullet(
    String data, {
    Key key,
    TextStyle style,
    TextAlign textAlign,
    TextDirection textDirection,
    Locale locale,
    bool softWrap,
    TextOverflow overflow,
    double textScaleFactor,
    int maxLines,
    String semanticsLabel,
  }) : super(
          '• $data',
          key: key,
          style: style,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
        );
}
