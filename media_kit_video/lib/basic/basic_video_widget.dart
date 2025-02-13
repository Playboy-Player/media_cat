import 'package:flutter/widgets.dart';
import 'basic_video_controller.dart';

class BasicVideo extends StatefulWidget {
  const BasicVideo({
    super.key,
    required this.bvc,
  });

  final BasicVideoController bvc;

  @override
  State<BasicVideo> createState() => _BasicVideoState();
}

class _BasicVideoState extends State<BasicVideo> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: ValueListenableBuilder<BasicVideoController?>(
        valueListenable: ValueNotifier(widget.bvc),
        builder: (context, notifier, _) => notifier == null
            ? const SizedBox.shrink()
            : ValueListenableBuilder<int?>(
                valueListenable: notifier.id,
                builder: (context, id, _) {
                  return ValueListenableBuilder<Rect?>(
                    valueListenable: notifier.rect,
                    builder: (context, rect, _) {
                      if (id != null && rect != null) {
                        return SizedBox(
                          width: rect.width,
                          height: rect.height,
                          child: Positioned.fill(
                            child: Texture(
                              textureId: id,
                              filterQuality: FilterQuality.low,
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  );
                },
              ),
      ),
    );
  }
}
