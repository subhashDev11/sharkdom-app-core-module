import 'package:app_core_module/app_core_module.dart';
import 'package:flutter/material.dart';
import 'package:app_core_module/core/api_routes.dart';


class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    required this.errorMsg,
    this.action,
    this.buttonTitle,
    this.title,
  });

  final String? title;
  final String errorMsg;
  final Function(BuildContext context)? action;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: title ?? "",
      showLeading: action == null,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmptyDataMessageWidget(
              message: errorMsg,
            ),
            if (action != null && buttonTitle != null)
              Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                ),
                child: Column(
                  children: [
                    if (errorMsg.contains("support"))
                      Container(
                        padding: EdgeInsets.only(
                          bottom: 10.h,
                        ),
                        child: PrimaryButton(
                          title: "Support",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => WebScreen.newInstance(
                                  url: WebUrl.helpURL,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    PrimaryButton(
                      title: buttonTitle ?? "Exit",
                      onTap: () {
                        if (action != null) {
                          action!(context);
                        }
                      },
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
