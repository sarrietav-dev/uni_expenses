enum AppRoute {
  home(route: "/"),
  settings(route: "/settings");

  const AppRoute({
    required this.route,
  });

  final String route;
}
