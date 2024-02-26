import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/model/risk_model.dart';
import 'package:iskaan_inspections_mobile/model/status_model.dart';

class AppConstants {
  /// drawer indexes
  static const int menuIndex = 0;
  static const int dashboardIndex = 1;
  static const int communitiesIndex = 2;
  static const int inspectionIndex = 3;
  static const int snagsIndex = 4;
  static const int generalIndex = 5;
  static const int profileIndex = 6;
  static const int logoutIndex = 7;

  /// inspection statuses
  static StatusModel inspectionInProgress = StatusModel(
    title: "In-Progress",
    color: const Color(0xFFe9bc18),
  );
  static StatusModel inspectionReadyForSubmission = StatusModel(
    title: "Ready For Submission",
    color: const Color(0xFF5a58eb),
  );
  static StatusModel inspectionSubmitted = StatusModel(
    title: "Submitted",
    color: const Color(0xFF179faa),
  );
  static StatusModel inspectionRejected = StatusModel(
    title: "Rejected",
    color: const Color(0xFFf9554c),
  );
  static StatusModel inspectionApproved = StatusModel(
    title: "Approved",
    color: const Color(0xFF2dcb73),
  );

  /// snags statuses
  static StatusModel snagNew = StatusModel(
    title: "New",
    color: const Color(0xFF179faa),
  );
  static StatusModel snagInProgress = StatusModel(
    title: "In-Progress",
    color: const Color(0xFFe9bc18),
  );
  static StatusModel snagCompleted = StatusModel(
    title: "Completed",
    color: const Color(0xFF2dcb73),
  );
  static StatusModel snagCancelled = StatusModel(
    title: "Cancelled",
    color: const Color(0xFFf9554c),
  );

  /// snag risks
  static RiskModel snagNoRisk = RiskModel(
    title: 'No Risk',
    color: const Color(0xFF94A3B8),
  );
  static RiskModel snagLowRisk = RiskModel(
    title: 'Low Risk',
    color: const Color(0xFF2dcb73),
  );
  static RiskModel snagMediumRisk = RiskModel(
    title: 'Medium Risk',
    color: const Color(0xFFe9bc18),
  );
  static RiskModel snagHighRisk = RiskModel(
    title: 'High Risk',
    color: const Color(0xFFf9352c),
  );
}
