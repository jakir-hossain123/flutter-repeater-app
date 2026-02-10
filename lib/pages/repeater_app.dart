
import 'package:flutter/material.dart';
 import 'package:flutter/services.dart';
class RepeaterApp extends StatefulWidget {
  const RepeaterApp({super.key});

  @override
  State<RepeaterApp> createState() => _RepeaterAppState();
}

class _RepeaterAppState extends State<RepeaterApp> {
  // two text fields controller and one string variable to store output
  final TextEditingController textController =TextEditingController();
  final TextEditingController countController =TextEditingController();
   String output ="";

   // repeater function
  void repeatText (){
    String text = textController.text;
    int times = int.tryParse(countController.text)??0;
    String result ="";
    for(int i=1; i<= times; i++){
      result += "$text\n";
    }
    setState(() {
      output = result;
    });
  }
  @override
  void dispose(){
    textController.dispose();
    countController.dispose();
    super.dispose();
  }
  
  void copyText (){
    if(output.isNotEmpty){
      Clipboard.setData(ClipboardData(text: output));
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: const Text('Text copied to clipboard ✅',
              textAlign: TextAlign.center,
            ),
          duration: Duration(seconds: 1),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height / 2 - 40,
            left: 20,
            right: 20,
          ),
        )
      );
    }
  }

  void refreshApp (){
    setState(() {
      textController.clear();
      countController.clear();
      output="";
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title:Text('Repeater App'),
      centerTitle: true,
      ),

      body: Padding(padding: EdgeInsets.all(16),child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              color: Colors.black87,thickness: 0.8,),
          ),
          TextField(
            controller: textController,
            decoration: const InputDecoration(
              labelText: "Enter text to repeat"
            ),
          ),
          TextField(
            controller: countController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Enter number of times to repeat"
            ),
          ),
          const SizedBox(height: 16,),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: repeatText,
                  child: Text('Repeat'),
              ),
              const SizedBox(width: 20,),
              ElevatedButton(
                onPressed: refreshApp,
                child: Icon(Icons.refresh),
              ),
              const SizedBox(width: 20,),
              ElevatedButton(
                onPressed: copyText,
                child: Icon(Icons.copy),
              ),
            ],
          ),
          const SizedBox(height: 16,),
          Expanded(child: SingleChildScrollView(
            child: Text(output),
          ))


        ],
      ),),
    );
  }
}
