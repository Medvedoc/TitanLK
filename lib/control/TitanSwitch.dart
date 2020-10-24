library list_tile_switch;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// Enum for deciding which type of switch to be displayed.
enum SwitchType { material, cupertino }
Widget widget(Color activeColor, Color inactiveColor,Color circleactiveColor, Color circleinactiveColor,
    _SwitchToggleCallback onChanged, bool value) {
  return _Switch(
    value: value,
    onChanged: onChanged,
    activeColor: activeColor,
    inactiveColor: inactiveColor,
    circleactiveColor: circleactiveColor,
    circleinactiveColor: circleinactiveColor,
  );
}

/// Special [Function] callback to control the toggle behavior.
/// Referring to the [onChanged] callback of [Switch] from Flutter SDK.
@protected
typedef _SwitchToggleCallback = void Function(bool);

/// Animation duration for [_Switch].
@protected
const Duration _kSwitchAnimationDuration = const Duration(milliseconds: 250);

class ListTileSwitch extends StatelessWidget {
  const ListTileSwitch(
      {Key key,
      @required this.value,
      this.switchScale = 0.6,
      this.switchActiveColor = Colors.blue,
      this.switchInactiveColor,
      this.circleActiveColor = Colors.blue,
      this.circleInactiveColor,
      @required this.onChanged,
      //@required this.title,
      this.subtitle,
      this.leading,
      this.enabled = true,
      this.isThreeLine = false,
      this.switchType,
      this.contentPadding,
      this.onLongPress,
      this.visualDensity,
      this.dense = false,
      this.focusNode,
      this.autoFocus = false,
      this.selected = false,
      this.focusColor,
      this.hoverColor,
      this.mouseCursor,
      this.toggleSelectedOnValueChange = false})
      : assert(value != null, onChanged != null),
        //assert(title != null),
        assert(switchScale <= 1.0),
        super(key: key);

  final double switchScale;
  final Color switchActiveColor;
  final Color switchInactiveColor;
  final Color circleActiveColor;
  final Color circleInactiveColor;
  final bool toggleSelectedOnValueChange;
  final SwitchType switchType;
  final bool value;
  final _SwitchToggleCallback onChanged;
  final Widget leading;
  //final Widget title;
  final Widget subtitle;
  final bool isThreeLine;
  final EdgeInsetsGeometry contentPadding;
  final VoidCallback onLongPress;
  final VisualDensity visualDensity;
  final bool dense;
  final bool enabled;
  final FocusNode focusNode;
  final bool autoFocus;
  final bool selected;
  final Color focusColor;
  final Color hoverColor;
  final MouseCursor mouseCursor;

  @override
  Widget build(BuildContext context) {
    return ListTileTheme.merge(
      selectedColor: switchActiveColor,
      style: ListTileStyle.list,
      child: ListTile(
        enabled: enabled,
        onTap: () => onChanged(!value),
        onLongPress: onLongPress,
        leading: leading,
        //title: title,
        subtitle: subtitle,
        trailing: Builder(
          builder: (_) => Transform.scale(
            alignment: Alignment.center,
            scale: switchType == SwitchType.material ? 1.0 : switchScale,
            child: widget(
                switchActiveColor,
                switchInactiveColor,circleActiveColor,
    circleInactiveColor ??
                    Theme.of(context).unselectedWidgetColor.withOpacity(0.1),
                onChanged,
                value),
          ),
        ),
        contentPadding: contentPadding,
        visualDensity: visualDensity,
        autofocus: autoFocus,
        focusNode: focusNode,
        selected: toggleSelectedOnValueChange ? value : selected,
        isThreeLine: isThreeLine,
        dense: dense,
        focusColor: focusColor,
        hoverColor: hoverColor,
        mouseCursor: mouseCursor,
      ),
    );
  }
}

class _Switch extends StatelessWidget {
  const _Switch({
    Key key,
    @required this.onChanged,
    @required this.value,
    this.inactiveColor,
    this.activeColor,
    this.circleinactiveColor,
    this.circleactiveColor,
  }) : super(key: key);

  final _SwitchToggleCallback onChanged;
  final bool value;
  final Color inactiveColor;
  final Color activeColor;
  final Color circleinactiveColor;
  final Color circleactiveColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: SizedBox(
        height: 35,
        width: 70,
        child: Stack(
          children: [
            AnimatedContainer(
              height: 35,
              width: 70,
              curve: Curves.ease,
              duration: _kSwitchAnimationDuration,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(25.0)),
                color: value ? activeColor : inactiveColor,
              ),
            ),
            AnimatedAlign(
              curve: Curves.ease,
              duration: _kSwitchAnimationDuration,
              alignment: !value ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                height: 20,
                width: 20,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: value ? circleactiveColor : circleinactiveColor,
                    //color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12.withOpacity(0.1),
                          spreadRadius: 0.5,
                          blurRadius: 1)
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
