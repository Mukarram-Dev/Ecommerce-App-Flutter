import 'package:ecommerce_app/config/routes/routes_name.dart';
import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FloatingActionMenu extends StatelessWidget {
  const FloatingActionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () {
        GoRouter.of(context).pushNamed(RouteName.createEventRoute);
      },
      backgroundColor: AppColors.primaryColor,
      child: const Icon(
        Icons.add,
        color: AppColors.white,
      ),
    );
  }
}

class ExtendedMenu extends StatefulWidget {
  const ExtendedMenu({super.key});

  @override
  State<ExtendedMenu> createState() => _ExtendedMenuState();
}

class _ExtendedMenuState extends State<ExtendedMenu> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: _isOpen ? 200 : 0,
          child: const Column(
            children: [
              ListTile(
                leading: Icon(Icons.event),
                title: Text('Event'),
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text('People'),
              ),
              ListTile(
                leading: Icon(Icons.place),
                title: Text('Place'),
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Share'),
              ),
            ],
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              _isOpen = !_isOpen;
            });
          },
          tooltip: _isOpen ? 'Close' : 'Open',
          backgroundColor: _isOpen ? Colors.red : Colors.blue,
          child: Icon(_isOpen ? Icons.close : Icons.add),
        ),
      ],
    );
  }
}
