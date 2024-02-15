import 'package:flutter/material.dart';
import 'package:app_core_module/core/app_widgets/app_scaffold.dart';
import 'package:app_core_module/core/app_widgets/primary_button.dart';

import 'empty_data_message_widget.dart';

class ErrorScreen extends StatelessWidget {

  const ErrorScreen({
    super.key,
    required this.errorMsg,
    this.action,
    this.buttonTitle,
  });

  final String errorMsg;
  final Function(BuildContext context)? action;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: "Error",
        showLeading: action==null,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyDataMessageWidget(
                message: errorMsg,
              ),
              if(action!=null && buttonTitle!=null)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: PrimaryButton(
                      title: buttonTitle ?? "Exit",
                      onTap: (){
                        if(action!=null){
                          action!(context);
                        }
                      },
                  ),
                )
            ],
          ),
        ),
    );
  }
}
