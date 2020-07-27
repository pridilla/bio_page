import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'card.dart';

var cards = [
  CardTile(
    title: "Abitur",
    tags: [Tags.schule, Tags.informatik, Tags.sprachen],
    widget: Column(
      children: [
        Wrap(
          children: [
            Text(
              "Am 25. Mai 2020 habe ich erfolgreich die Abiturprüfung in der Slowakei mit dem Durchschnitt 1.0 abgelegt.\n\nMeine Abiturfächer waren Informatik, Mathematik, Deutsch und Slowakisch.",
              style: smallTextStyle,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ],
    ),
  ),
  
  CardTile(
    title: "Englisch",
    tags: [Tags.schule, Tags.sprachen],
    widget: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("C1", style: bigTextStyle,),
        Text("NIVEAU", style: smallBoldTextStyle,),
        SizedBox(height: 15),
        Wrap(
          children: [
            Text(
              "Ich lerne Englisch seit 2006 und habe seitdem viele wetvolle Erfahrungen in diesem Bereich gesammelt. Sowohl die Kommunikation auf dem Internet, als auch die Teilnahme an internationalen Wettbewerben und Veranstaltungen hat mir geholfen, meine Englischkenntnisse zu vertiefen.",
              style: smallTextStyle,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ],
    ),
  ),

  CardTile(
    title: "Deutsch",
    tags: [Tags.schule, Tags.sprachen],
    widget: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("C1", style: bigTextStyle,),
        Text("NIVEAU", style: smallBoldTextStyle,),
        SizedBox(height: 15),
        Wrap(
          children: [
            Text(
              "Ich lerne Deutsch seit 2013. In 2018 habe ich angefange, Deutsch intensiver zu lernen, damit ich in Deutschland studieren kann. In 2020 habe ich die Prüfung TestDaF bestanden und damit wurde meine Deutschkentnisse auf dem Niveau C1 formal nachgewiesen.",
              style: smallTextStyle,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ],
    ),
  ),

  CardTile(
    title: "Chinesich",
    tags: [Tags.sprachen],
    widget: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("HSK2", style: bigTextStyle,),
        Text("NIVEAU", style: smallBoldTextStyle,),
        SizedBox(height: 15),
        Wrap(
          children: [
            Text(
              "Während der Koronakrise habe ich mich entschlossen, Chinesich zu lernen. Das HSK1 Niveau habe ich schnell bewältigt und dabei habe ich eine sehr unterhaltsame Aktivität entdeckt. In der Zukunft will ich meine Chinesich deutlich verbessern.",
              style: smallTextStyle,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ],
    ),
  ),

  CardTile(
    title: "Slowakisch",
    tags: [Tags.sprachen],
    widget: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("C2", style: bigTextStyle,),
        Text("NIVEAU", style: smallBoldTextStyle,),
        SizedBox(height: 15),
        Wrap(
          children: [
            Text(
              "Ja, es ist einfach meine Muttersprache. Trotzdem finde ich das informativ. :)",
              style: smallTextStyle,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ],
    ),
  ),

  CardTile(
    title: "Dart/Flutter",
    tags: [Tags.informatik],
    widget: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Wrap(
          children: [
            Text(
              "Diese Programmiersprache wird heutzutage immer populärer, weil es eine effektive hybride Lösung für Mobilegeräte ist.\n\nDieser Framework kommt mir sehr einfach vor und habe darin schon mehrere Apps programmiert. Darunter fällt selbstverständlich auch diese Webseite.",
              style: smallTextStyle,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ],
    ),
  ),

  CardTile(
    title: "Python",
    tags: [Tags.informatik, Tags.schule],
    widget: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Wrap(
          children: [
            Text(
              "Python habe ich in der Schule gelernt. Python nutze ich immer, wenn ich ein einfaches Programm oder einen einfachen Algorithmus schreiben muss.",
              style: smallTextStyle,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ],
    ),
  ),

  CardTile(
    title: "Helfni",
    tags: [Tags.projekte, Tags.informatik],
    widget: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Wrap(
          children: [
            RichText(
              text: TextSpan(
                text: "Helfni ist ein vielversprechender Start-up, dessen Ziel ist, die Freiwilligen in der Slowakei zu unterstützen.\n\nHelfni hat mich sehr stark motiviert, meine Programmierfähigkeiten zu verbessern, als auch zu lernen, ein Team zu leiten. Besuchen Sie doch unsere Webseite ",
                style: smallTextStyle,
                children: [
                  TextSpan(
                    text: "helfni.sk.",
                    style: smallBlueTextStyle,
                    recognizer: TapGestureRecognizer()..onTap = (){launch("https://helfni.sk");}
                  )
                ]
              ),
              
            ),
          ],
        ),
      ],
    ),
  ),
];