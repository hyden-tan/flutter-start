/// 统一管理轮询，当app回到后台时统一关闭，回到前台时打开

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

bool isAppVisible() => SchedulerBinding.instance.lifecycleState == AppLifecycleState.resumed;

class Period {
  /// 轮询描述
  final String desc;
  /// 时间间隔，单位毫秒
  final int duration;
  final Function() callback;

  Period({
    @required this.desc,
    @required this.callback,
    @required this.duration,
  });
}

class PeriodManager {
  static int _autoIncreamentId = 0;
  static PeriodManager _instance = PeriodManager();

  static PeriodManager get instance => _instance;

  Map<int, Period> _periods = {};

  /// 判断当前是否已开启后台定时器
  bool _hasOpenTimer = false;

  /// 开启一个定时器监控app是否回到前台，当回到前台是恢复所有定时器
  _createBackgroundTimer() {
    if (_hasOpenTimer) {
      return;
    }

    _hasOpenTimer = true;
    Timer.periodic(Duration(milliseconds: 200), (timer) {
      if (isAppVisible()) {
        _hasOpenTimer = false;
        timer.cancel();
        _resume();
      }
    });
  }
  

  /// 清理period
  _clear(Timer timer, int id) {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
    if (_periods[id] != null) {
      _periods.remove(id);
    }
  }

  /// 注册period
  Function regist(Period period) {
    final id = ++_autoIncreamentId;
    
    final timer = Timer.periodic(Duration(milliseconds: period.duration), (_timer) {
      /// 如果当前app不可见，则主动cancel
      if (!isAppVisible()) {
        _clear(_timer, id);
        _periods[id] = period;
        _createBackgroundTimer();
      }
      /// 执行period
      period.callback();
    });
    
    return () => _clear(timer, id);
  }

  /// 恢复period
  _resume() {
    _periods.forEach((_, period) {
      if (period != null) {
        regist(period);
      }
    });
  }
}
