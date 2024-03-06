enum EmotionType {
  happiness(
      emotion: 'happiness',
      displayName: '행복',
      iconAssetPath: "assets/image/emotion/happiness.png"),
  excitement(
      emotion: 'excitement',
      displayName: '신남',
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
      displayName: '고통',
      iconAssetPath: "assets/image/emotion/painful.png"),
  sadness(
      emotion: 'sadness',
      displayName: '슬픔',
      iconAssetPath: "assets/image/emotion/sadness.png"),
  noFun(
      emotion: 'noFun',
      displayName: '노잼',
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
