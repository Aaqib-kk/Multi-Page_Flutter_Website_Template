# Multi-Page Flutter Website Template

This repository provides a template for building multi-page websites using Flutter. The template comes with a simple dropdown navigation that allows users to select different organizations. Upon selection, the website displays events related to the chosen organization.

## Features

- Multi-page navigation using Flutter's Router and Navigator.
- Dropdown menu for selecting organizations.
- Dynamic loading of events based on the selected organization.
- Beautiful UI for displaying event details.

## Getting Started

To get started with the project, follow these steps:

1. Ensure you have Flutter installed. If not, [install Flutter](https://flutter.dev/docs/get-started/install) first.
2. Clone this repository using `git clone https://github.com/Aaqib-kk/Multi-Page_Flutter_Website_Template.git`.
3. Open the project in your favorite IDE or code editor.
4. Run the app using `flutter run` command.

## How It Works

The app uses Flutter's Router and Navigator for multi-page navigation. The `MyRouterDelegate` handles the navigation and updates the URL based on the selected organization. The `HomePage` widget contains the dropdown menu for organization selection, and the `EventPage` widget displays the events related to the chosen organization.

The `Event` model class defines the structure of event data fetched from the backend API. The `fetchEvents` function retrieves event data based on the selected organization.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

## Acknowledgments

- The Flutter team for creating an amazing framework.
- Special thanks to the open-source community for their valuable contributions.

>>>>>>> fc0927981d558be11fa8a41d8e3bc4e55747016e
