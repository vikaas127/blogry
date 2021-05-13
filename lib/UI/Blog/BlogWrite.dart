import 'package:blogry/app/ApiData.dart';
import 'package:blogry/app/appConstant.dart';
import 'package:blogry/app/appperferance.dart';
import 'package:blogry/model/Blog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_summernote/flutter_summernote.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Blogget.dart';

//import 'package:html_editor/html_editor.dart';

class BlogWrite extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BlogWriteState();
  }

}
class BlogWriteState extends State<BlogWrite>{


  String t= "\" {  \\\"time\\\" : 1620296397349,      \\\"blocks\\\" : [          {              \\\"type\\\" : \\\"header\\\",              \\\"data\\\" : {                  \\\"text\\\" : \\\"Editor.js\\\",                  \\\"level\\\" : 2              }          },          {              \\\"type\\\" : \\\"paragraph\\\",              \\\"data\\\" : {                  \\\"text\\\" : \\\"Hey. Meet the new Editor. On this page you can see it in action — try to edit this text.\\\"              }          },          {              \\\"type\\\" : \\\"header\\\",              \\\"data\\\" : {                  \\\"text\\\" : \\\"Key features\\\",                  \\\"level\\\" : 3              }          },          {              \\\"type\\\" : \\\"list\\\",              \\\"data\\\" : {                  \\\"style\\\" : \\\"unordered\\\",                  \\\"items\\\" : [                      \\\"It is a block-styled editor\\\",                      \\\"It returns clean data output in JSON\\\",                      \\\"Designed to be extendable and pluggable with a simple API\\\"                  ]              }          },          {              \\\"type\\\" : \\\"header\\\",              \\\"data\\\" : {                  \\\"text\\\" : \\\"What does it mean «block-styled editor»\\\",                  \\\"level\\\" : 3              }          },          {              \\\"type\\\" : \\\"paragraph\\\",              \\\"data\\\" : {                  \\\"text\\\" : \\\"Workspace in classic editors is made of a single contenteditable element, used to create different HTML markups. Editor.js <mark class=\\\"cdx-marker\\\">workspace consists of separate Blocks: paragraphs, headings, images, lists, quotes, etc</mark>. Each of them is an independent contenteditable element (or more complex structure) provided by Plugin and united by Editor's Core.\\\"              }          },          {              \\\"type\\\" : \\\"paragraph\\\",              \\\"data\\\" : {                  \\\"text\\\" : \\\"There are dozens of <a href=\\\"https://github.com/editor-js\\\">ready-to-use Blocks</a> and the <a href=\\\"https://editorjs.io/creating-a-block-tool\\\">simple API</a> for creation any Block you need. For example, you can implement Blocks for Tweets, Instagram posts, surveys and polls, CTA-buttons and even games.\\\"              }          },          {              \\\"type\\\" : \\\"header\\\",              \\\"data\\\" : {                  \\\"text\\\" : \\\"What does it mean clean data output\\\",                  \\\"level\\\" : 3              }          },          {              \\\"type\\\" : \\\"paragraph\\\",              \\\"data\\\" : {                  \\\"text\\\" : \\\"Classic WYSIWYG-editors produce raw HTML-markup with both content data and content appearance. On the contrary, Editor.js outputs JSON object with data of each Block. You can see an example below\\\"              }          },          {              \\\"type\\\" : \\\"paragraph\\\",              \\\"data\\\" : {                  \\\"text\\\" : \\\"Given data can be used as you want: render with HTML for <code class=\\\"inline-code\\\">Web clients</code>, render natively for <code class=\\\"inline-code\\\">mobile apps</code>, create markup for <code class=\\\"inline-code\\\">Facebook Instant Articles</code> or <code class=\\\"inline-code\\\">Google AMP</code>, generate an <code class=\\\"inline-code\\\">audio version</code> and so on.\\\"              }          },          {              \\\"type\\\" : \\\"paragraph\\\",              \\\"data\\\" : {                  \\\"text\\\" : \\\"Clean data is useful to sanitize, validate and process on the backend.\\\"              }          },          {              \\\"type\\\" : \\\"delimiter\\\",              \\\"data\\\" : {}          },          {              \\\"type\\\" : \\\"paragraph\\\",              \\\"data\\\" : {                  \\\"text\\\" : \\\"We have been working on this project more than three years. Several large media projects help us to test and debug the Editor, to make it's core more stable. At the same time we significantly improved the API. Now, it can be used to create any plugin for any task. Hope you enjoy. 😏\\\"              }          },          {              \\\"type\\\" : \\\"image\\\",              \\\"data\\\" : {                  \\\"file\\\" : {                      \\\"url\\\" : \\\"https://codex.so/public/app/img/external/codex2x.png\\\"                  },                  \\\"caption\\\" : \\\"\\\",                  \\\"withBorder\\\" : false,                  \\\"stretched\\\" : false,                  \\\"withBackground\\\" : false              }          }      ],      \\\"version\\\" : \\\"2.20.2\\\"  }\"";
 // QuillController _controller = QuillController.basic();
  //GlobalKey<HtmlEditorState> keyEditor = GlobalKey();
  String result = "";
  GlobalKey<FlutterSummernoteState> _keyEditor = GlobalKey();
  TextEditingController titlecontroller=TextEditingController();
  final _scaffoldState = GlobalKey<ScaffoldState>();
 // String result = "";
  Blog blog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(title:Text("Blog Write",style: GoogleFonts.aBeeZee(fontSize: 18),) ,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () async {
              final value = await _keyEditor.currentState.getText();
              print(value);
              AppPreferences.getString(AppConstants.Token).then((valuetoken) {
                print(valuetoken);
                setState(() {
           
                  ApiClient().addnewBlog(valuetoken, titlecontroller.text.toString(), value.toString()).then((
                      value) => blog=Blog.fromJson(value.data['blog'])).then((value) =>  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Blogget(blogid:blog.sId)),));
                  _scaffoldState.currentState.showSnackBar(SnackBar(
                    duration: Duration(seconds: 5),
                    content: Text(value),
                  ));
                });
              });
            } )
        ],
      ),
      backgroundColor: Colors.white,
      body:
      ListView(shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [


      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: titlecontroller,
        decoration: InputDecoration(

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          hintText: 'Enter a Your Post Title'
    ),


    // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
      ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlutterSummernote(
                  hint: "Your text here...",
                   key: _keyEditor,
                  showBottomToolbar: true,
                  hasAttachment: false,
                  customToolbar: """
                    [
                      ['style', ['bold', 'italic', 'underline', 'clear']],
                      ['font', ['strikethrough', 'superscript', 'subscript']],
                      ['insert', ['link', 'table', 'hr']]
                    ]
                  """,
                ),
          ),
        ],
      ),


    );
      // This trailing comma makes auto-formatting nicer for build methods.

  }
}