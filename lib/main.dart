// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mokhtary Week 5'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool firstPage = true;
  bool isLoading = false;
  bool refresh = false;

  List<Customers> customers = [
    Customers("Conner","Mokhtary",1,"Saver"),
    Customers("Tony","Soprano",2,"Spender"),
    Customers("Shawn","Kimmons",3,"Saver"),
    Customers("Collin","Klapahke",4,"Saver"),
    Customers("Tony","Stark",5,"Spender"),
    Customers("Jason","Vorrhes",6,"Occasional"),
    Customers("Tom","Celic",7,"Saver"),
    Customers("Robert","De Niro",8,"Frequent"),
    Customers("Kirk","Cousins",9,"Frequent"),
    Customers("Domonic","Ryan",10,"Spender"),

  ];

  _retrieveRefresh(){
    Future.delayed(Duration(seconds: 3), (){
      refresh = true;
    });
  }

  _refresh(){
    setState(() {
      
    
      firstPage = true;
      isLoading = false;
      refresh = false;
      });
  }

  void _btnPressed(){
    setState(() {
      firstPage = false;
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 3), (){
      setState(() {
        isLoading = false;
        refresh = true;

      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child:  firstPage ? ElevatedButton(onPressed: _btnPressed, child: Text("Load Items"),
        )
        : isLoading 
          ? Column(mainAxisAlignment: MainAxisAlignment.center, 
            children: <Widget>[CircularProgressIndicator(),
              Text("Please Wait")],
          )

            : SingleChildScrollView(      

      
              child: Column(
               

                
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: customers.map((customers){
                    return Padding(padding: EdgeInsets.all(8.0), 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                        Text(customers.FirstName, style: TextStyle(fontSize: 25)),
                        Text(customers.LastName),
                        Text("Customer ID: ${customers.CustomerId}"),
                        Text(customers.Type),
                        Divider()
                        ],
                       ),

                       );
                  }).toList(),
                  
                  ),
                ),


          
       

      ),
       floatingActionButton: refresh ? FloatingActionButton(onPressed: _refresh, child: Icon(Icons.refresh)
       ) : _retrieveRefresh(),

    );

       // This trailing comma makes auto-formatting nicer for build methods.
    
  }
}

class Customers{
  String FirstName;
  String LastName;
  int CustomerId;
  String Type;

  Customers(this.FirstName, this.LastName, this.CustomerId, this.Type);
}