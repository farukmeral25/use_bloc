enum MainEndpoints {
  fetchPost,
}

extension MainEndPointExtension on MainEndpoints {
  String stateToEndpoint() {
    switch (this) {
      case MainEndpoints.fetchPost:
        return "r/flutterdev/top.json?count=20";
    }
  }
}
