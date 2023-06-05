import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'fullscreen_dialog_widget.dart';

class Pertemuan10Screen extends StatefulWidget {
  const Pertemuan10Screen({super.key});

  @override
  State<Pertemuan10Screen> createState() => _Pertemuan10ScreenState();
}

class _Pertemuan10ScreenState extends State<Pertemuan10Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          MaterialBanner(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Banner',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Text.')
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => ScaffoldMessenger.of(context)
                      ..removeCurrentMaterialBanner()
                      ..showMaterialBanner(showBanner(context)),
                    child: const Text('Show Banner'))
              ]),
              MaterialBanner(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dialogs',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Text.')
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) => showAlertDialog(context)),
                    child: const Text('Alert Dialog')),
                    TextButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) => showSimpleDialog(context)),
                    child: const Text('Simple Dialog')),
                    TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: ((context) => FullScreenDialog()))),
                    child: const Text('Alert Dialog')),
              ]),
              MaterialBanner(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Snackbars',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Snackbars provide brief messages about app processess at the bottom of the screen.')
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => ScaffoldMessenger.of(context)
                      .showSnackBar(showSnackBar(context)),
                    child: const Text('Snackbar'))
              ]),
        ],
      ),
    );
  }

  showBanner(BuildContext context) {
    return MaterialBanner(
        content: const Text('Welcome to banner info!'),
        leading: const Icon(
          Icons.info,
          color: Colors.orange,
        ),
        actions: [
          TextButton(onPressed: () {}, child: const Text('Agree')),
          TextButton(
              onPressed: () =>
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
              child: const Text('Dismiss')),
        ]);
  }

  showAlertDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Reset settings?'),
      content: const Text(
          'This will reset your device to its default factory settings.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('ACCEPT'),
        ),
      ],
    );
  }

  showSimpleDialog(BuildContext context) {
    return SimpleDialog(
      title: const Text('Set backup account'),
      children: List.generate(4, ((index) {
        return SimpleDialogOption(
          onPressed: () => Navigator.pop(context, 'mail$index@mail.com'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.abc, size: 36, color: Colors.amber),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 16),
                child: Text('Username$index'),
              )
            ],
          ),
        );
      })),
    );
  }

  showSnackBar(BuildContext context) {
    return SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 6),
        content: Text('Welcome to snackbar'),
        action: SnackBarAction(label: 'Dismiss',
        onPressed: () => ScaffoldMessenger.of(context).removeCurrentSnackBar()),
        );
  }
}
