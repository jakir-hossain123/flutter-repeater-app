# flutter-repeater-app
I got the app idea while learning dart loop. 

//here i used for loop for repeating text.
void repeatText (){
    String text = textController.text;
    int times = int.tryParse(countController.text)??0;
    String result ="";
    for(int i=1; i<= times; i++){
      result += "$text\n";
    }

    // this function to copy repeated text 
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
