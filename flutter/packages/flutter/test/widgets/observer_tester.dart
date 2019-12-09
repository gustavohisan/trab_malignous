// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

typedef OnObservation = void Function(Route<dynamic> route, Route<dynamic> previousRoute);

/// A trivial observer for testing the navigator.
class TestObserver extends NavigatorObserver {
  OnObservation onPushed;
  OnObservation onPopped;
  OnObservation onRemoved;
  OnObservation onReplaced;
  OnObservation onStartUserGesture;

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (onPushed != null) {
      onPushed(route, previousRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (onPopped != null) {
      onPopped(route, previousRoute);
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (onRemoved != null)
      onRemoved(route, previousRoute);
  }

  @override
  void didReplace({ Route<dynamic> oldRoute, Route<dynamic> newRoute }) {
    if (onReplaced != null)
      onReplaced(newRoute, oldRoute);
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (onStartUserGesture != null)
      onStartUserGesture(route, previousRoute);
  }
}
