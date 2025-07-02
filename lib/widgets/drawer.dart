import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl="https://wallpaperaccess.com/full/1238364.jpg";
    return Drawer(
      child:Container(
        color:Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              padding:EdgeInsets.zero,
              margin:EdgeInsets.zero,
              child:UserAccountsDrawerHeader(
          
                margin:EdgeInsets.zero,
                accountName: Text("parvati"),
                accountEmail: Text("parvati@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage:NetworkImage(imageUrl) ,
                ),
        
              ),
        
            ),
            ListTile(
              leading: 
              Icon(CupertinoIcons.home,color: Colors.white,
              ),
              title:Text("Home",
              textScaleFactor:1.2,
              style:TextStyle(
                color:Colors.white,

              )
              ),
            ),
             ListTile(
              leading: 
              Icon(CupertinoIcons.profile_circled,
              color: Colors.white,
              ),
              title:Text("profile",
              textScaleFactor:1.2,
              style:TextStyle(
                color:Colors.white,

              )
              ),
            ),
             ListTile(
              leading: 
              Icon(CupertinoIcons.mail,
              color: Colors.white,
              ),
              title:Text("Email me",
              textScaleFactor:1.2,
              style:TextStyle(
                color:Colors.white,

              )
              ),
            ),
          ],
        ),
      ),
    );
  }
}