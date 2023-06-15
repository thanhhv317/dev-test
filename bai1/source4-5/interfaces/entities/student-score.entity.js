const convertTranscriptType = require("../../infrastructure/utils/convert-type-transcript");

class StudentScoreEntity {
  constructor(payload) {
    this.id = payload.id || payload._id || "";
    this.student_id = payload.student_id || "";
    this.name = payload.name || "";
    this.score = payload.score || 0;
    this.coefficient = payload.coefficient || 1;
    this.type = convertTranscriptType(payload.type || 0);
    this.subject_name = payload.subject_name || "";
  }
}

module.exports = StudentScoreEntity;
