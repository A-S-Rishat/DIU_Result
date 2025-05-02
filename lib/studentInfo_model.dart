class studentInfo {
  String? studentId;
  String? fkCampus;
  String? campusName;
  String? studentName;
  String? batchId;
  int? batchNo;
  int? programCredit;
  String? programId;
  String? programName;
  String? progShortName;
  String? programType;
  String? deptShortName;
  String? departmentName;
  String? facultyName;
  String? facShortName;
  String? semesterId;
  String? semesterName;
  String? shift;

  studentInfo(
      {this.studentId,
      this.fkCampus,
      this.campusName,
      this.studentName,
      this.batchId,
      this.batchNo,
      this.programCredit,
      this.programId,
      this.programName,
      this.progShortName,
      this.programType,
      this.deptShortName,
      this.departmentName,
      this.facultyName,
      this.facShortName,
      this.semesterId,
      this.semesterName,
      this.shift});

  studentInfo.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    fkCampus = json['fkCampus'];
    campusName = json['campusName'];
    studentName = json['studentName'];
    batchId = json['batchId'];
    batchNo = json['batchNo'];
    programCredit = json['programCredit'];
    programId = json['programId'];
    programName = json['programName'];
    progShortName = json['progShortName'];
    programType = json['programType'];
    deptShortName = json['deptShortName'];
    departmentName = json['departmentName'];
    facultyName = json['facultyName'];
    facShortName = json['facShortName'];
    semesterId = json['semesterId'];
    semesterName = json['semesterName'];
    shift = json['shift'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentId'] = this.studentId;
    data['fkCampus'] = this.fkCampus;
    data['campusName'] = this.campusName;
    data['studentName'] = this.studentName;
    data['batchId'] = this.batchId;
    data['batchNo'] = this.batchNo;
    data['programCredit'] = this.programCredit;
    data['programId'] = this.programId;
    data['programName'] = this.programName;
    data['progShortName'] = this.progShortName;
    data['programType'] = this.programType;
    data['deptShortName'] = this.deptShortName;
    data['departmentName'] = this.departmentName;
    data['facultyName'] = this.facultyName;
    data['facShortName'] = this.facShortName;
    data['semesterId'] = this.semesterId;
    data['semesterName'] = this.semesterName;
    data['shift'] = this.shift;
    return data;
  }
}