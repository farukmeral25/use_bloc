enum DomainResourceEnum { reddit }

extension DomainResourceEnumExtension on DomainResourceEnum {
  String getUrlByState() {
    switch (this) {
      case DomainResourceEnum.reddit:
        return "https://www.reddit.com/";
    }
  }
}
