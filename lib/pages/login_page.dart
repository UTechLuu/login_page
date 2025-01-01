import 'package:flutter/material.dart';
import 'package:login_page/components/app_elevated_button.dart';
import 'package:login_page/components/app_text_field.dart';
import 'package:login_page/components/app_text_field_password.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:login_page/utils/extension.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Lấy giá trị nhập vào từ người dùng
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<Color> colors = [Colors.red, Colors.green];
  List<String> colorNames = ['R', 'G'];
  late int selectedIndex;// quyết định màu sẽ hiển thị

  void _submitLogin() {// xử lý khi nhấn nút đăng nhập
    String username = usernameController.text.trim();
    String password = passwordController.text;

    String validate;

    if (username.isEmpty && password.isEmpty) {
      validate = 'Input username and password';
    } else if (username.isEmpty) {
      validate = 'Input username';
    } else if (password.isEmpty) {
      validate = 'Input password';
    } else {
      validate = 'valid';
    }

    if (validate != 'valid') {
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('👴'),
            content: Text(
              validate,
              style: const TextStyle(color: Colors.brown, fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              AppElevatedButton.outline(
                text: 'OK',
                height: 40.0,
                onPressed: () => Navigator.of(context).pop(),//dùng để đóng dialog
              ),
            ],
          );
        },
      );
      return;
    }
    Navigator.of(context).pushAndRemoveUntil(//tat ca hop le thi sang homepage
        MaterialPageRoute(builder: (context) => HomePage(title: username)),
        (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => FocusScope.of(context).unfocus(),
      onTap: () => context.focus.unfocus(),
      child: Scaffold(
        appBar: _appBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Login',
                  style:
                      TextStyle(color: colors[selectedIndex], fontSize: 26.0),
                  textAlign: TextAlign.center,// căn giữa văn bản
                ),
                const SizedBox(height: 40.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: AppTextField(
                    controller: usernameController,
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.orange,
                    ),
                    hintText: 'Username',
                    textInputAction: TextInputAction.next,
                  ),
                ),
                20.sizeHeight,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: AppTextFieldPassword(
                    controller: passwordController,
                    prefixIcon: Icon(Icons.password, color: Colors.orange),
                    hintText: 'Password',
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _submitLogin(),
                  ),
                ),
                60.sizeHeight,
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FractionallySizedBox(//có kích thước tự động theo nội dung của nó
                    alignment: Alignment.centerLeft,
                    child: AppElevatedButton(
                      text: 'Login',
                      onPressed: _submitLogin,
                    ),
                  ),
                ),
                90.sizeHeight,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      6,
                      (idx) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: AppElevatedButton(
                            color: colors[selectedIndex],
                            onPressed: () {},
                            text: 'Button ${idx + 1}'),
                      ),
                    ),
                  ),
                ),
                60.sizeHeight,
                Row(
                  children: [
                    const Spacer(flex: 1),
                    Expanded(
                      flex: 3,
                      child: AppElevatedButton(
                        text: 'Trang Le',
                        onPressed: () {},
                      ),
                    ),
                    const Spacer(flex: 1),
                    Expanded(
                      flex: 3,
                      child: AppElevatedButton(
                        text: 'Ngo Luu',
                        onPressed: () {},
                      ),
                    ),
                    const Spacer(flex: 1),
                    Expanded(
                      flex: 3,
                      child: AppElevatedButton(
                        text: 'Hoang Anh',
                        onPressed: () {},
                      ),
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      leading: Icon(Icons.ac_unit, size: 26.0, color: Colors.red),
      title: Text(
        widget.title,
        style: TextStyle(
            color: colors[selectedIndex],
            fontSize: 30.0,
            fontWeight: FontWeight.bold), // thay doi mau chu
      ),
      actions: [
        ...List.generate(colors.length, (idx) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                selectedIndex = idx; //cap nhat selecIndex
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 12.6,
                child: Text(
                  colorNames[idx],
                  style: TextStyle(color: colors[idx], fontSize: 16.8),
                ),
              ),
            ),
          );
        }),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
