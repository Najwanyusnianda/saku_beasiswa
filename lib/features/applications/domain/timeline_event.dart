// lib/features/applications/domain/timeline_event.dart

import 'package:flutter/material.dart';

/// An enum to define the type of event for styling purposes
enum TimelineEventType { milestone, task }

/// A simple data class to represent a single event on the timeline.
class TimelineEvent {
  final String title;
  final DateTime date;
  final TimelineEventType type;
  final bool isCompleted;
  final IconData icon;

  TimelineEvent({
    required this.title,
    required this.date,
    required this.type,
    required this.isCompleted,
    required this.icon,
  });
}
