import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MassengerDesign extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://scontent.fgza6-1.fna.fbcdn.net/v/t1.6435-9/118395062_3226056974181666_8590133274940677625_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=Bcrh6ppukzAAX8dDBZF&_nc_ht=scontent.fgza6-1.fna&oh=00_AT_w8Ut50lvD6f1-ghvU1-VQf1b447uE5xxm1OAkc7CGIg&oe=62CB86F8'
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon:CircleAvatar(
                backgroundColor: Colors.grey[300],
                 radius: 15,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                  size: 20,
                ),

          ),

          ),
          IconButton(
            onPressed: (){},
            icon:CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: 15,
              child: Icon(
                Icons.edit,
                color: Colors.black,
                size: 20,
              ),

            ),

          ),
        ],
        titleSpacing: 20,

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsetsDirectional.all(7),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadiusDirectional.circular(20),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.grey,

                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
               height: 100,
               child: ListView.separated(
                 scrollDirection:Axis.horizontal ,
                   itemBuilder: (context, index) => buildStoryItem(),
                   separatorBuilder:(context, index) => SizedBox(width: 10,) ,
                   itemCount: 15,
               ),
             ),
              SizedBox(height: 20),
              ListView.separated(
                  shrinkWrap: true,
                  physics:NeverScrollableScrollPhysics() ,
                  itemBuilder: (context, index) => Row(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                'https://scontent.fgza6-1.fna.fbcdn.net/v/t1.6435-9/118395062_3226056974181666_8590133274940677625_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=Bcrh6ppukzAAX8dDBZF&_nc_ht=scontent.fgza6-1.fna&oh=00_AT_w8Ut50lvD6f1-ghvU1-VQf1b447uE5xxm1OAkc7CGIg&oe=62CB86F8'

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              bottom:2,
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 8,


                            ),
                          ),
                        ],
                      ),
                      SizedBox(width:20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Karim Habboub',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'ربي اشرح لي صدري ويسر لي امري واحلل العقدة من لساني يفقه قولي',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,

                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                CircleAvatar(
                                  radius:2.5,
                                  backgroundColor: Colors.black,

                                ),
                                SizedBox(width: 5),
                                Text(
                                    '07:04 am'
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  separatorBuilder:(context, index) => SizedBox(height: 15,) ,
                  itemCount: 20)



            ],
          ),
        ),

      ),

    );
  }
  Widget buildStoryItem() =>  Row(
    children: [
      Container(
        width: 60,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://scontent.fgza6-1.fna.fbcdn.net/v/t1.6435-9/118395062_3226056974181666_8590133274940677625_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=Bcrh6ppukzAAX8dDBZF&_nc_ht=scontent.fgza6-1.fna&oh=00_AT_w8Ut50lvD6f1-ghvU1-VQf1b447uE5xxm1OAkc7CGIg&oe=62CB86F8'

                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom:2,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 8,


                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              alignment: AlignmentDirectional.center,
              child: Text(
                'Karim Rashid Habboub',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),

                maxLines: 2,
                overflow: TextOverflow.ellipsis,

              ),
            ),
          ],
        ),
      ),
    ],
  );
  Widget buildChatItem() => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                'https://scontent.fgza6-1.fna.fbcdn.net/v/t1.6435-9/118395062_3226056974181666_8590133274940677625_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=Bcrh6ppukzAAX8dDBZF&_nc_ht=scontent.fgza6-1.fna&oh=00_AT_w8Ut50lvD6f1-ghvU1-VQf1b447uE5xxm1OAkc7CGIg&oe=62CB86F8'

            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom:2,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 8,


            ),
          ),
        ],
      ),
      SizedBox(width:20,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Karim Habboub',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'ربي اشرح لي صدري ويسر لي امري واحلل العقدة من لساني يفقه قولي',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,

                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius:2.5,
                  backgroundColor: Colors.black,

                ),
                SizedBox(width: 5),
                Text(
                    '07:04 am'
                ),
              ],
            ),
          ],
        ),
      ),

    ],
  );
}
