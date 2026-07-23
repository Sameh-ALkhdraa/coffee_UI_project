import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/config/app_config.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:provider/provider.dart';

class LanguageButton extends StatefulWidget {
  const LanguageButton({super.key});

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {

  @override
  Widget build(BuildContext context) {
    final appConfig = Provider.of<AppConfig>(context, listen: true); 
    String selectedLanguage = appConfig.getLang() ?? "en";
    return PopupMenuButton<String>(
      onSelected: (value) {
        setState(() {
          selectedLanguage = value;
        });
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () {
            appConfig.setLang('en');
          },
          value: context.t.en,
          child: Text(context.t.en),
        ),
        PopupMenuItem(
          onTap: () {
            appConfig.setLang('ar');
          },
          value: context.t.ar,
          child: InkWell(
            child: Text(context.t.ar)
          ),
        ),
      ],
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.deepPurple,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              selectedLanguage,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, size: 18),
          ],
        ),
      ),
    );
  }
}