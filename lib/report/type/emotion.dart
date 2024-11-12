enum EmotionType {
  happiness(
      emotion: 'happiness',
      displayName: '행복',
      iconAssetPath: "assets/image/emotion/happiness.png"),
  comfortable(
      emotion: "comfortable",
      displayName: "편안",
      iconAssetPath: "assets/image/emotion/comfortable.png"),
  excitement(
      emotion: 'excitement',
      displayName: '재미',
      iconAssetPath: "assets/image/emotion/excitement.png"),
  anticipation(
      emotion: 'anticipation',
      displayName: '기대',
      iconAssetPath: "assets/image/emotion/anticipation.png"),
  soSo(
      emotion: 'soso',
      displayName: '쏘쏘',
      iconAssetPath: "assets/image/emotion/soso.png"),
  pain(
      emotion: 'painful',
      displayName: '짜증',
      iconAssetPath: "assets/image/emotion/painful.png"),
  sadness(
      emotion: 'sadness',
      displayName: '슬픔',
      iconAssetPath: "assets/image/emotion/sadness.png"),
  noFun(
      emotion: 'noFun',
      displayName: '무기력',
      iconAssetPath: "assets/image/emotion/noFun.png"),
  undefined(emotion: 'undefined', displayName: '', iconAssetPath: ''); // 기본값

  final String emotion;
  final String displayName;
  final String iconAssetPath;

  const EmotionType({
    required this.emotion,
    required this.displayName,
    required this.iconAssetPath,
  });
}
