/// {@template video_controller_configuration}
///
/// BasicVideoControllerConfiguration
/// ----------------------------
/// Configurable options for customizing the [VideoController] behavior.
///
/// {@endtemplate}
class BasicVideoControllerConfiguration {
  /// Sets the [`--vo`](https://mpv.io/manual/stable/#options-vo) property on native backend.
  ///
  /// Default: Platform specific.
  /// * Windows, GNU/Linux, macOS & iOS: `libmpv`
  /// * Android: `gpu`
  final String? vo;

  /// Sets the [`--hwdec`](https://mpv.io/manual/stable/#options-hwdec) property on native backend.
  ///
  /// Default: Platform specific.
  /// * Windows, GNU/Linux, macOS & iOS : `auto`
  /// * Android: `auto-safe`
  final String? hwdec;

  /// The scale for the video output.
  /// This may be used for performance reasons. Specifying this option will cause [width] & [height] to be ignored.
  ///
  /// Default: `1.0`
  final double scale;

  /// The fixed width for the video output.
  /// This may be used for performance reasons.
  ///
  /// Default: `null`
  final int? width;

  /// The fixed height for the video output.
  /// This may be used for performance reasons.
  ///
  /// Default: `null`
  final int? height;

  /// Whether to enable hardware acceleration.
  ///
  /// DO NOT DISABLE THIS OPTION MEANINGLESSLY.
  /// THE BATTERY WILL DRAIN, THE DEVICE MAY HEAT UP & CPU USAGE WILL BE HIGH.
  ///
  /// Default: `true`
  final bool enableHardwareAcceleration;

  /// Whether to attach `android.view.Surface` after video parameters are known.
  ///
  /// Default:
  /// * [vo] == gpu : `true`
  /// * [vo] != gpu : `false`
  final bool? androidAttachSurfaceAfterVideoParameters;

  /// {@macro video_controller_configuration}
  const BasicVideoControllerConfiguration({
    this.vo,
    this.hwdec,
    this.width,
    this.height,
    this.scale = 1.0,
    this.enableHardwareAcceleration = true,
    this.androidAttachSurfaceAfterVideoParameters,
  });

  /// Returns a copy of this class with the given fields replaced by the new values.
  BasicVideoControllerConfiguration copyWith({
    String? vo,
    String? hwdec,
    double? scale,
    int? width,
    int? height,
    bool? enableHardwareAcceleration,
    bool? androidAttachSurfaceAfterVideoParameters,
  }) =>
      BasicVideoControllerConfiguration(
        vo: vo ?? this.vo,
        hwdec: hwdec ?? this.hwdec,
        scale: scale ?? this.scale,
        width: width ?? this.width,
        height: height ?? this.height,
        enableHardwareAcceleration:
            enableHardwareAcceleration ?? this.enableHardwareAcceleration,
        androidAttachSurfaceAfterVideoParameters:
            androidAttachSurfaceAfterVideoParameters ??
                this.androidAttachSurfaceAfterVideoParameters,
      );
}
