import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart'
    as core show HtmlWidget, RebuildTriggers;

import 'data.dart';
import 'helpers.dart';
import 'widget_factory.dart';

export 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart'
    show HtmlWidgetState;

/// A widget that builds Flutter widget tree from HTML
/// with support for IFRAME, VIDEO and many other tags.
class HtmlWidget extends core.HtmlWidget {
  /// Controls whether IFRAME is rendered as [WebView].
  ///
  /// See [WidgetFactory.webView].
  @Deprecated("Override WidgetFactory.webView instead")
  final bool webView;

  /// Controls whether debugging is enabled in WebViews.
  ///
  /// See [WidgetFactory.webViewDebuggingEnabled].
  @Deprecated("Override WidgetFactory.webView instead")
  final bool webViewDebuggingEnabled;

  /// Controls whether to enable JavaScript in WebViews.
  ///
  /// See [WidgetFactory.webViewJs].
  @Deprecated("Override WidgetFactory.webView instead")
  final bool webViewJs;

  /// Controls whether to always allow media playback in WebViews.
  ///
  /// See [WidgetFactory.webViewMediaPlaybackAlwaysAllow].
  @Deprecated("Override WidgetFactory.webView instead")
  final bool webViewMediaPlaybackAlwaysAllow;

  /// The value used for the HTTP `User-Agent` request header in WebViews.
  ///
  /// See [WidgetFactory.webViewUserAgent].
  @Deprecated("Override WidgetFactory.webView instead")
  final String? webViewUserAgent;

  /// Creates a widget that builds Flutter widget tree from html.
  ///
  /// The [html] argument must not be null.
  HtmlWidget(
    String html, {
    bool? buildAsync,
    bool enableCaching = true,
    WidgetFactory Function()? factoryBuilder,
    Key? key,
    Uri? baseUrl,
    CustomStylesBuilder? customStylesBuilder,
    CustomWidgetBuilder? customWidgetBuilder,
    OnErrorBuilder? onErrorBuilder,
    OnLoadingBuilder? onLoadingBuilder,
    void Function(ImageMetadata)? onTapImage,
    FutureOr<bool> Function(String)? onTapUrl,
    core.RebuildTriggers? rebuildTriggers,
    RenderMode renderMode = RenderMode.column,
    TextStyle? textStyle,
    @Deprecated("Override WidgetFactory.webView instead") this.webView = false,
    @Deprecated("Override WidgetFactory.webViewDebuggingEnabled instead")
        this.webViewDebuggingEnabled = false,
    @Deprecated("Override WidgetFactory.webViewJs instead")
        this.webViewJs = true,
    @Deprecated("Override WidgetFactory.webViewMediaPlaybackAlwaysAllow instead")
        this.webViewMediaPlaybackAlwaysAllow = false,
    @Deprecated("Override WidgetFactory.webViewUserAgent instead")
        this.webViewUserAgent,
  }) : super(
          html,
          baseUrl: baseUrl,
          buildAsync: buildAsync,
          customStylesBuilder: customStylesBuilder,
          customWidgetBuilder: customWidgetBuilder,
          enableCaching: enableCaching,
          factoryBuilder: factoryBuilder ?? _getEnhancedWf,
          onErrorBuilder: onErrorBuilder,
          onLoadingBuilder: onLoadingBuilder,
          onTapImage: onTapImage,
          onTapUrl: onTapUrl,
          rebuildTriggers: core.RebuildTriggers([
            webView,
            webViewJs,
            if (rebuildTriggers != null) rebuildTriggers,
          ]),
          renderMode: renderMode,
          textStyle: textStyle,
          key: key,
        );

  static WidgetFactory _getEnhancedWf() => WidgetFactory();
}
