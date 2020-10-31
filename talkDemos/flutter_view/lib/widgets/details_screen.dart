import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_view/widgets/search_bar.dart';
import '../constants.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
                color: kBlueLightColor,
                image: DecorationImage(
                  image: AssetImage("assets/images/meditation_bg.png"),
                  fit: BoxFit.fitWidth,
                )),
          ),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  'Meditation',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 10),
                Text(
                  '3-10 MIN Course',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: size.width * .6,
                  child: Text(
                      'Live happier and healthier by learning the fundamentals of meditation and hjklkljjl'),
                ),
                SizedBox(
                  width: size.width * .5,
                  child: SearchBar(),
                ),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    SessionCard(
                      sessionNum: 0,
                      isDone: true,
                      press: () {},
                    ),
                    SessionCard(
                      sessionNum: 1,
                      isDone: false,
                      press: () {},
                    ),
                    SessionCard(
                      sessionNum: 2,
                      isDone: false,
                      press: () {},
                    ),
                    SessionCard(
                      sessionNum: 3,
                      isDone: false,
                      press: () {},
                    ),
                    SessionCard(
                      sessionNum: 4,
                      isDone: false,
                      press: () {},
                    ),
                    SessionCard(
                      sessionNum: 5,
                      isDone: false,
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Meditation',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                RowItem(),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  const RowItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(10),
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 23,
            spreadRadius: -13,
            color: kShadowColor,
          )
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
              "assets/icons/Meditation_women_small.svg"),
          SizedBox(width: 20),
          Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Basic 2',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text('Start your deepen you practice'),
            ],
          )),
          Padding(
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset("assets/icons/Lock.svg")
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNum;
  final bool isDone;
  final Function press;
  const SessionCard({
    Key key,
    this.sessionNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              )
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Session $sessionNum',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
