import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _counter =0;
  String _content = 'الحمد لله';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value){
              if(_content != value){
                setState(() {
                  _content = value;
                  _counter = 0;
                });
              }
            },
              itemBuilder: (context) {
                return[
                   PopupMenuItem(
                      child: Text('تسبيــح',style: GoogleFonts.cairo(fontSize: 14),
                      ),
                      value: "سبحان الله",
                  ),
                   PopupMenuItem(
                    child: Text('تحميــد',style: GoogleFonts.cairo(fontSize: 14),
                    ),
                      value: "الحمد لـله",
                  ),
                   PopupMenuItem(
                    child: Text('تهليــل',style: GoogleFonts.cairo(fontSize: 14),
                    ),
                    value: "لا إله إلا الله",
                  ),
                   PopupMenuItem(
                    child: Text('تكبيــر', style: GoogleFonts.cairo(fontSize: 14),
                    ),
                    value: "الله أكبـر",
                  ),
                   PopupMenuItem(
                    child: Text('إستغفـار', style: GoogleFonts.cairo(fontSize: 14),
                    ),
                    value: "أستغفر الله العظيم وأتوب إليه",
                  ),
                  PopupMenuItem(
                    child: Text('الصلاة على الحبيب', style: GoogleFonts.cairo(fontSize: 14),
                    ),
                    value: "اللهمَّ صلّ على سيدنا محمد",
                  ),

                ];
              })
        ],
        backgroundColor: Colors.teal,
        elevation: 0,

        title: Text(
        AppLocalizations.of(context)!.app_name,
        style: GoogleFonts.cairo(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            ++_counter;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/ab.jpeg'),
            fit: BoxFit.cover
          )
          // gradient: LinearGradient(
          //   begin: AlignmentDirectional.topStart,
          //   end: AlignmentDirectional.bottomEnd,
          //   colors: [
          //     Colors.teal.shade800,
          //     Colors.teal.shade100
          //   ]
          // )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                margin: EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('images/count.jpeg')),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0,0),
                      color: Colors.black38,
                      blurRadius: 6,
                    )
                  ]
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(_content,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.cairo(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ),
                    Container(
                      color: Colors.teal,
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: Text(_counter.toString(),
                        style: GoogleFonts.cairo(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,

                        ),),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          ++_counter;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightGreenAccent.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            bottomStart: Radius.circular(8),
                          )
                        )
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.tassbeh,
                        style: GoogleFonts.cairo(),
                      ))
                  ),
                  Expanded(
                      child:
                        ElevatedButton(
                          onPressed: (){
                            setState(() {
                              _counter =0;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightGreen.shade800,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(8)
                              )
                            )
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.reset,
                            style: GoogleFonts.cairo(),
                          )
                        )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
