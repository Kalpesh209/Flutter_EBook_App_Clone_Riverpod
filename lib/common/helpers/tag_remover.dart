String removeAllHtmlTags(String htmlText) {
  return htmlText.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
}
