import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20.0,
        actions: [
          CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.blue,
            child: Center(
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt,
                    size: 16.0,
                    color: Colors.white,
                  )),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.blue,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  size: 16.0,
                  color: Colors.white,
                )),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://media.newyorker.com/photos/606cd925407075a363d50dec/master/w_2560%2Cc_limit/Indurti-PersonofColorSomethingHappened.jpg'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text('Search'),
                    
                  ],
                ),
              ),
              const SizedBox(height: 10.0,),
              SizedBox(
                height: 110.0,
                child: ListView.separated(itemBuilder: (context,index){
                  return buildStoryItem();
                }, separatorBuilder: (context,index){
                  return const SizedBox(width: 10.0,);
                }, itemCount: 8,scrollDirection: Axis.horizontal,),
              ),
              const SizedBox(height: 20.0,),

              ListView.separated(itemBuilder: (context,index){
                return buildChatItem();
              }, separatorBuilder: (context,index){
                return const SizedBox(height: 10.0,);
              }, itemCount: 15,shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),)
              
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItem() {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: const [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://media.newyorker.com/photos/606cd925407075a363d50dec/master/w_2560%2Cc_limit/Indurti-PersonofColorSomethingHappened.jpg'),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(bottom: 3.0, end: 5.0),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mohamed Esmail  ',
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: Text(
                          'Hello My Name Is Mohamed Esmail Mohamed',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        child: CircleAvatar(
                          radius: 3.0,
                          backgroundColor: Colors.black,
                        ),
                      ),
                      Text('02.00 pm'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget buildStoryItem(){
    return SizedBox(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: const [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://media.newyorker.com/photos/606cd925407075a363d50dec/master/w_2560%2Cc_limit/Indurti-PersonofColorSomethingHappened.jpg'),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    bottom: 3.0, end: 5.0),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'Mohamed Esmail Mohamed',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ) ;
  }

}
