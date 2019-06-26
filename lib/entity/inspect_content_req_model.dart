class InspectContentReqModel {
  String equipmentId;
  String planId;
  List<TargetResults> targetResults;

  InspectContentReqModel({
    this.equipmentId,
    this.planId,
    this.targetResults,
  });

  InspectContentReqModel.fromJson(Map<String, dynamic> json) {
    equipmentId = json['equipmentId'];
    planId = json['planId'];
    if (json['targetResults'] != null) {
      targetResults = new List<TargetResults>();
      json['targetResults'].forEach((v) {
        targetResults.add(new TargetResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['equipmentId'] = this.equipmentId;
    data['planId'] = this.planId;
    if (this.targetResults != null) {
      data['targetResults'] =
          this.targetResults.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TargetResults {
  bool inspectionResult;
  String targetContent;
  String targetId;

  TargetResults({
    this.inspectionResult,
    this.targetContent,
    this.targetId,
  });

  TargetResults.fromJson(Map<String, dynamic> json) {
    inspectionResult = json['inspectionResult'];
    targetContent = json['targetContent'];
    targetId = json['targetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inspectionResult'] = this.inspectionResult;
    data['targetContent'] = this.targetContent;
    data['targetId'] = this.targetId;
    return data;
  }
}
