import 'package:azlistview/azlistview.dart';

class StringSuspensionBean with ISuspensionBean{
  late String tagIndex;

  String name;

  StringSuspensionBean({required this.name,this.tagIndex=""});

  @override
  String getSuspensionTag() {
   return tagIndex;
  }

}