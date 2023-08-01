import 'package:flutter/material.dart';
import 'package:my_website/model/eventModel.dart';
import 'package:my_website/repository/repository.dart';
import 'dart:html' as html;

import 'package:my_website/view/event_page.dart';

class MyRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  String? _selectedOrganization;

  String? get selectedOrganization => _selectedOrganization;

  set selectedOrganization(String? organization) {
    if (_selectedOrganization != organization) {
      _selectedOrganization = organization;
      notifyListeners();
    }
  }

  @override
  PageConfiguration get currentConfiguration =>
      PageConfiguration(selectedOrganization);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: HomePage(
            selectedOrganization: selectedOrganization,
            onOrganizationSelected: (organization) {
              selectedOrganization = organization;
            },
          ),
        ),
        if (_selectedOrganization != null)
          MaterialPage(
            child: FutureBuilder<List<Event>>(
              future: Repository.fetchEvents(_selectedOrganization!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error fetching events: ${snapshot.error}'),
                  );
                } else {
                  return EventPage(
                    events: snapshot.data!,
                    organization: _selectedOrganization!,
                  );
                }
              },
            ),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        selectedOrganization = null;
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) async {
    // This method is called when the route is restored from the URL.
    // Set the selected organization using the onOrganizationSelected callback.
    if (configuration.selectedOrganization != null) {
      selectedOrganization = configuration.selectedOrganization;
    }
  }
}

class MyRouteInformationParser
    extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.length == 1) {
      final organization = uri.pathSegments.first;
      return PageConfiguration(organization);
    } else {
      return PageConfiguration(null);
    }
  }

  @override
  RouteInformation? restoreRouteInformation(PageConfiguration configuration) {
    if (configuration.selectedOrganization != null) {
      return RouteInformation(
          location: '/${configuration.selectedOrganization}');
    } else {
      return RouteInformation(location: '/');
    }
  }
}

class PageConfiguration {
  final String? selectedOrganization;

  PageConfiguration(this.selectedOrganization);
}

class HomePage extends StatefulWidget {
  final String? selectedOrganization;
  final ValueChanged<String> onOrganizationSelected;

  HomePage(
      {required this.selectedOrganization,
      required this.onOrganizationSelected});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: widget.selectedOrganization,
              onChanged: (String? newValue) {
                setState(() {
                  widget
                      .onOrganizationSelected(newValue ?? "matzsolutions.com");
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'matzsolutions.com',
                  child: Text('matzsolutions.com'),
                ),
                DropdownMenuItem(
                  value: 'dawlance.com',
                  child: Text('dawlance.com'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (widget.selectedOrganization != null) {
                  // Other parts of the code remain the same...
                }
              },
              child: Text('View Events'),
            ),
          ],
        ),
      ),
    );
  }
}
