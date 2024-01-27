
import 'package:programming_assignment_3/pages/admin/menu_page.dart';
import 'package:programming_assignment_3/services/app_menu.dart';
import 'package:programming_assignment_3/services/get_menu.dart';
import 'package:programming_assignment_3/services/navigator_service.dart';

class AddNewProduct extends AppMenu {
  @override
  Future<void> build() async {
    print('Add New item');
    if (menuList.length == 10) {
      print('The menu list is full, you cannot add more ...');
      Navigator.push(AdminMenuPage());
    }
    addMenu(menuList);

    viewMenu(menuList);
  }
}
