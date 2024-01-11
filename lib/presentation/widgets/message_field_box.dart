import 'package:flutter/material.dart';

class MessageFieldBox extends StatefulWidget {
  const MessageFieldBox({super.key});

  @override
  State<MessageFieldBox> createState() => _MessageFieldBoxState();
}

class _MessageFieldBoxState extends State<MessageFieldBox> {
  final textController = TextEditingController();
  final focusNode = FocusNode();
  
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() => setState(() {}));
  }
  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(5));

    final inputDecoration = InputDecoration(
      hintText: 'Message ONI...',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      fillColor: focusNode.hasFocus
          ? const Color(0xff1d1d1d)
          : const Color(0xff707070),
      focusColor: Colors.red,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: FloatingActionButton.small(
          backgroundColor: focusNode.hasFocus
              ? const Color(0xfffcc755)
              : const Color(0xff313131),
          foregroundColor: const Color(0xff1d1d1d),
          child: const Icon(Icons.arrow_upward_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            print('button: $textValue');
            textController.clear();
          },
        ),
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onChanged: (value) {
        print('onChanged : $value');
      },
      onFieldSubmitted: (value) {
        print('Submit value $value');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
