class LolcodeInterpreter {
  String run(String code) {
    if (!code.contains("HAI") || !code.contains("KTHXBYE")) {
      return "Invalid LOLCODE program.";
    }

    if (code.contains("VISIBLE")) {
      final start = code.indexOf("VISIBLE") + 8;
      final text = code.substring(start).trim();
      return text.replaceAll("\"", "");
    }

    return "OK but your LOLCODE did nothing.";
  }
}
