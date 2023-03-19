import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0, bottom: 10.0),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(25),
                      // image: DecorationImage(
                      //   image: CachedNetworkImageProvider(widget.photoUrl),
                      //   fit: BoxFit.cover,
                      // ),
                      ),
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      'post',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Metropolis'),
                    ),
                  ),
                  Text(
                    'Posts',
                    style: TextStyle(fontFamily: 'Metropolis', fontSize: 12),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Icon(
                  Iconsax.more,
                  size: 10,
                  color: Colors.grey,
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      '11',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Metropolis'),
                    ),
                  ),
                  Text(
                    'Followers',
                    style: TextStyle(fontFamily: 'Metropolis', fontSize: 12),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Icon(
                  Iconsax.more,
                  size: 10,
                  color: Colors.grey,
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      '36',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Metropolis'),
                    ),
                  ),
                  Text(
                    'Following',
                    style: TextStyle(fontFamily: 'Metropolis', fontSize: 12),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "widget.name.toUpperCase()",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Metropolis',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
                // constraints: BoxConstraints(maxWidth: ),
                child: Text('desc}')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    style: ButtonStyle(
                      // backgroundColor: MaterialStateProperty.all<Color>(
                      //   followlist.contains(loggedInUser.uid)
                      //       ? Colors.white
                      //       : Colors.blue,
                      // ),
                    ),
                    onPressed: () async {
                      // if (!followlist.contains(loggedInUser.uid.toString())) {
                      //   setState(() {
                      //     // widget.followState = 'Unfollow';
                      //     followers += 1;
                      //     widget.followers = followers;
                      //     followlist.add(loggedInUser.uid.toString());
                      //     cufollowing += 1;
                      //   });
                      // } else {
                      //   setState(() {
                      //     // widget.followState = 'Follow';
                      //     followers -= 1;
                      //     widget.followers = followers;
                      //     followlist.remove(loggedInUser.uid.toString());
                      //     cufollowing -= 1;
                      //   });
                      // }
                      // _store
                      //     .collection('users')
                      //     .doc(widget.userid)
                      //     .update({'followers': followers});

                      // _store
                      //     .collection('users')
                      //     .doc(widget.userid)
                      //     .update({'followerlist': followlist});

                      // _store.collection('users').doc(loggedInUser.uid).update({
                      //   'followinglist': followlist,
                      // });
                      // _store
                      //     .collection('users')
                      //     .doc(loggedInUser.uid.toString())
                      //     .update({'following': cufollowing});
                    },
                    child: Text(
                    //   followlist.contains(loggedInUser.uid.toString())
                    //       ? 'Unfollow'
                    //       : 'Follow',
                    //   style: TextStyle(
                    //       color:
                    //           followlist.contains(loggedInUser.uid.toString())
                    //               ? Colors.black
                    //               : Colors.white),
                    // ),
                    "Unfollow"),
              )),),
              SizedBox(width: 10),
              Expanded(
                  child: Container(
                child: OutlinedButton(
                    onPressed: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return PmScreen(selectedUser: widget.userid);
                      // }));
                    },
                    child: Text(
                      'Message',
                      style: TextStyle(color: Colors.black),
                    )),
              )),
            ],
          ),
          // Row(
          //   children: <Widget>[
          //     Container(
          //       height: 100,
          //       width: 100,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(20),
          //         border: Border()
          //       ),
          //       child: Icon(Icons.add),
          //     ),
          //   ],
          // ),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: <Widget>[
          //       Highlight(
          //           name: 'Github',
          //           url:
          //               'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png'),
          //       Highlight(
          //           name: 'LinkedIn',
          //           url:
          //               'https://cdn2.iconfinder.com/data/icons/simple-social-media-shadow/512/14-512.png'),
          //       Highlight(
          //           name: 'LinkedIn',
          //           url:
          //               'https://cdn2.iconfinder.com/data/icons/simple-social-media-shadow/512/14-512.png'),
          //       Highlight(
          //           name: 'LinkedIn',
          //           url:
          //               'https://cdn2.iconfinder.com/data/icons/simple-social-media-shadow/512/14-512.png'),
          //       Highlight(
          //           name: 'LinkedIn',
          //           url:
          //               'https://cdn2.iconfinder.com/data/icons/simple-social-media-shadow/512/14-512.png'),
          //     ],
          //   ),
          // ),
          // ProfilePosts(
          //   userid: widget.userid,
          // ),
        ],
      ),
    );
  }
}

// class Highlights extends StatefulWidget {
//   final String name;
//   final String url;

//   Highlights({@required this.name, @required this.url});

//   @override
//   _HighlightsState createState() => _HighlightsState();
// }

// class _HighlightsState extends State<Highlights> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
//       child: Column(children: <Widget>[]),
//     );
//   }
// }

// class ProfilePosts extends StatefulWidget {
//   final userid;

//   ProfilePosts({@required this.userid});
//   @override
//   _ProfilePostsState createState() => _ProfilePostsState();
// }

// class _ProfilePostsState extends State<ProfilePosts> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 500,
//       height: 500,
//       child: Column(
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Expanded(
//                 child: Material(
//                     type: MaterialType
//                         .transparency, //Makes it usable on any background color, thanks @IanSmith
//                     child: Ink(
//                       decoration: BoxDecoration(
//                         border: Border(
//                             bottom: BorderSide(
//                                 color: _persposts ? Colors.black : Colors.grey,
//                                 width: 0.5)),
//                         color: Colors.white,
//                         shape: BoxShape.rectangle,
//                       ),
//                       child: InkWell(
//                         //This keeps the splash effect within the circle
//                         borderRadius: BorderRadius.circular(
//                             1000), //Something large to ensure a circle
//                         onTap: () {
//                           setState(() {
//                             _persposts = true;
//                           });
//                         },
//                         child: Center(
//                           child: Padding(
//                             padding: EdgeInsets.all(20.0),
//                             child: Icon(
//                               FontAwesomeIcons.thLarge,
//                               color: _persposts ? Colors.black : Colors.grey,
//                               size: 15,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )),
//               ),
//               Expanded(
//                 child: Material(
//                   type: MaterialType
//                       .transparency, //Makes it usable on any background color, thanks @IanSmith
//                   child: Ink(
//                       decoration: BoxDecoration(
//                         border: Border(
//                             bottom: BorderSide(
//                                 color: _persposts ? Colors.grey : Colors.black,
//                                 width: 0.5)),
//                         color: Colors.white,
//                         shape: BoxShape.rectangle,
//                       ),
//                       child: InkWell(
//                         //This keeps the splash effect within the circle
//                         borderRadius: BorderRadius.circular(
//                             1000.0), //Something large to ensure a circle
//                         onTap: () {
//                           setState(() {
//                             _persposts = false;
//                           });
//                         },
//                         child: Center(
//                           child: Padding(
//                             padding: EdgeInsets.all(20.0),
//                             child: Icon(
//                               FontAwesomeIcons.userTag,
//                               size: 15,
//                               color: _persposts ? Colors.grey : Colors.black,
//                             ),
//                           ),
//                         ),
//                       )),
//                   // child: IonButton(
//                   //     onPressed: () {
//                   //       setState(() {
//                   //         _persposts = false;
//                   //       });
//                   //     },
//                   //     icon: Icon(
//                   //       FontAwesomeIcons.solidIdBadge,
//                   //     )),
//                 ),
//               ),
//             ],
//           ),
//           _persposts
//               ? ProfilePostsStream(userid: widget.userid)
//               : Expanded(child: Tagged()),
//         ],
//       ),
//     );
//   }
// }