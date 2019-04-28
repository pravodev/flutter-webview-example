import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webview Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myController = TextEditingController();
  String url = 'https://github.com/pravodev';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    super.dispose();
  }

  Widget buildWebView(BuildContext context, _title, _showBackButton) {
    return WebviewScaffold(
      url: this.url,
      appBar: new AppBar(
        title: Text(_title),
        automaticallyImplyLeading: _showBackButton,
        actions: <Widget>[
          RaisedButton.icon(
            label: Text("EDIT URL", style: TextStyle(color: Colors.yellow),),
            icon: Icon(Icons.edit, color: Colors.yellow,),
            onPressed: (){
              Navigator.of(context).pop();
            },
            color: Colors.blue[300],
          )
        ],
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Webview Example'),
      ),
      drawer: _createDrawer(),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Center(child: Text("WEBVIEW", style: TextStyle(fontSize: 50.0),)),
          TextField(
            autofocus: true,
            controller: myController,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(width: 40.0)),
              hintText: this.url
            ),
          ),
          Center(
            child: RaisedButton.icon(
              icon: Icon(Icons.exit_to_app),
              label: Text('Go'),
              color: Colors.white54,
              onPressed: () => _goToWebView(),
            ),
          )
        ],
      ),
    );
  }

  void _goToWebView(){
    String text = myController.text;
    if(text == "" || text == null){
      return _showAlert("Url Cannot Empty");
    }
    
    setState(() {
      url = text;
    });
    
    Navigator.of(context).push(MaterialPageRoute( 
      builder: (context) => buildWebView(context, "Webview Example", false)
    ));
  }

  void _showAlert(text){
    SnackBar snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    );

    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Drawer _createDrawer()
  {
    return Drawer(

      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Image.network("https://avatars2.githubusercontent.com/u/37338847?s=460&v=4", fit: BoxFit.cover,),
            padding: EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text("My GitHub"),
            subtitle: Text("Open My Github"),
            dense: true,
            leading: Icon(Icons.open_in_new),
            onTap: () {
              setState(() {
                url = 'https://github.com/pravodev';
              });
              Navigator.of(context).push(MaterialPageRoute( 
                builder: (context) => buildWebView(context, "My Github", true)
              ));
            },
          )
        ],
      ),
    );
  }
}