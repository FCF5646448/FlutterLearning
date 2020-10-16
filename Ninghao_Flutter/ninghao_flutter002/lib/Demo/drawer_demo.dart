import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName:
                Text('fcf', style: TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: Text('fcf@gmal.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3136885515,3090335975&fm=26&gp=0.jpg'),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow[400],
              image: DecorationImage(
                image: NetworkImage(
                    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2520923007,3102208893&fm=26&gp=0.jpg'),
                fit: BoxFit.cover,
                //颜色滤镜
                colorFilter: ColorFilter.mode(
                    Colors.yellow[400].withOpacity(0.6), BlendMode.hardLight),
              ),
            ),
          ),
          // DrawerHeader(
          //   child: Text('header'.toUpperCase()),
          //   decoration: BoxDecoration(
          //     color: Colors.grey[100],
          //   ),
          // ),
          ListTile(
            title: Text('Message', textAlign: TextAlign.right),
            trailing: Icon(Icons.message, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Favorite', textAlign: TextAlign.right),
            trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Settings', textAlign: TextAlign.right),
            trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
